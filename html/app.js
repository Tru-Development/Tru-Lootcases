const app = document.getElementById('app');
const roller = document.getElementById('roller');
const title = document.getElementById('caseTitle');
const result = document.getElementById('result');
const brandingEl = document.getElementById('branding');
let currentCase = null;

const defaultRarityColors = { common:'#ffffff', rare:'#009dff', epic:'#a855f7', legendary:'#ffbf00' };

function cleanRarity(rarity) {
  rarity = (rarity || 'common').toLowerCase();
  if (rarity === 'legendary') return 'legendary';
  if (rarity === 'epic') return 'epic';
  if (rarity === 'rare') return 'rare';
  return 'common';
}


const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
function tone(freq, duration, volume=0.03){
  try{
    const osc = audioCtx.createOscillator();
    const gain = audioCtx.createGain();
    osc.frequency.value = freq;
    osc.type = 'sine';
    gain.gain.value = volume;
    osc.connect(gain);
    gain.connect(audioCtx.destination);
    osc.start();
    gain.gain.exponentialRampToValueAtTime(0.0001, audioCtx.currentTime + duration);
    osc.stop(audioCtx.currentTime + duration);
  }catch(e){}
}
function playTick(progress = 0){
  // Pitch and volume slowly fall off to match the roller deceleration.
  const freq = 1350 - Math.min(progress, 1) * 520;
  const vol = 0.018 - Math.min(progress, 1) * 0.006;
  tone(freq, 0.035, vol);
}
function playOpen(){ tone(400,0.08,0.03); setTimeout(()=>tone(650,0.08,0.025),70); }
function playWin(rarity = 'common'){
  const r = cleanRarity(rarity);
  tone(700,0.12,0.03);
  setTimeout(()=>tone(1000,0.16,0.03),120);
  setTimeout(()=>tone(1400,0.22,0.025),260);
  if (r === 'epic' || r === 'legendary') {
    setTimeout(()=>tone(1650,0.28,0.025),430);
  }
  if (r === 'legendary') {
    setTimeout(()=>tone(1900,0.35,0.025),650);
  }
}
function startSyncedTicks(duration){
  let active = true;
  const started = performance.now();
  function schedule(){
    if (!active) return;
    const elapsed = performance.now() - started;
    const progress = Math.min(elapsed / duration, 1);
    playTick(progress);
    // Starts quick, then spaces out like the case roller slowing down.
    const delay = 55 + Math.pow(progress, 2.15) * 430;
    if (progress < 0.985) setTimeout(schedule, delay);
  }
  setTimeout(schedule, 80);
  return () => { active = false; };
}

const resource = typeof GetParentResourceName === 'function' ? GetParentResourceName() : 'Tru-Lootcases';

function post(name, data = {}) {
  fetch(`https://${resource}/${name}`, {
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body:JSON.stringify(data)
  }).catch(()=>{});
}

function applyTheme(theme = {}, caseColor = '#ffffff') {
  document.documentElement.style.setProperty('--caseColor', caseColor || theme.accent || '#ffffff');
  document.documentElement.style.setProperty('--brandColor', theme.accent || '#8ccc3f');
  document.documentElement.style.setProperty('--panelColor', theme.panel || '#0a0c10');
  document.documentElement.style.setProperty('--commonColor', theme.common || defaultRarityColors.common);
  document.documentElement.style.setProperty('--rareColor', theme.rare || defaultRarityColors.rare);
  document.documentElement.style.setProperty('--epicColor', theme.epic || defaultRarityColors.epic);
  document.documentElement.style.setProperty('--legendaryColor', theme.legendary || defaultRarityColors.legendary);
}

function rarityColor(rarity, theme = {}) {
  const r = cleanRarity(rarity);
  if (r === 'legendary') return theme.legendary || defaultRarityColors.legendary;
  if (r === 'epic') return theme.epic || defaultRarityColors.epic;
  if (r === 'rare') return theme.rare || defaultRarityColors.rare;
  return theme.common || defaultRarityColors.common;
}

function getItemImage(item, fallbackCaseImage) {
  if (item.image) {
    if (item.image.includes('/') || item.image.startsWith('nui://')) return item.image;
    return `img/items/${item.image}`;
  }
  if (item.item) return `img/items/${item.item}.png`;
  return `img/${fallbackCaseImage}`;
}

function createItem(item, caseImage, theme) {
  const el = document.createElement('div');
  const rarity = cleanRarity(item.rarity);
  const color = rarityColor(rarity, theme);
  el.className = `item ${rarity}`;
  el.style.setProperty('--rarity', color);
  el.innerHTML = `
    <img src="${getItemImage(item, caseImage)}" draggable="false" onerror="this.src='img/${caseImage}'">
    <b>${item.label || item.item || 'Reward'}</b>
    <small>${item.amount || 1}x</small>
  `;
  return el;
}

function applyBranding(branding = {}) {
  const enabled = branding.enabled === true && branding.title && branding.title.trim() !== '';
  if (!enabled) {
    brandingEl.classList.add('hidden');
    brandingEl.textContent = '';
    return;
  }
  brandingEl.textContent = branding.title;
  brandingEl.style.color = branding.color || 'var(--brandColor)';
  brandingEl.style.textShadow = `0 0 16px ${branding.color || 'var(--brandColor)'}`;
  brandingEl.classList.remove('hidden');
}

function openCase(data) {
  currentCase = data.caseName;
  applyTheme(data.theme || {}, data.color || '#ffffff');
  applyBranding(data.branding || {});

  title.textContent = data.caseLabel || 'Loot Case';
  result.classList.add('hidden');
  result.textContent = '';
  roller.innerHTML = '';
  roller.style.transition = 'none';
  roller.style.transform = 'translate3d(0,0,0)';

  (data.items || []).forEach(item => roller.appendChild(createItem(item, data.caseImage, data.theme || {})));
  app.classList.remove('hidden');

  const duration = data.duration || 7000;
  playOpen();
  const stopTicks = startSyncedTicks(duration);
  requestAnimationFrame(() => {
    const itemWidth = 156;
    const winningIndex = 37;
    const wrapWidth = document.querySelector('.roller-wrap').offsetWidth;
    const offset = winningIndex * itemWidth - wrapWidth / 2 + itemWidth / 2 + (Math.random() * 24 - 12);
    roller.style.transition = `transform ${duration}ms cubic-bezier(.08,.72,.08,1)`;
    roller.style.transform = `translate3d(-${offset}px,0,0)`;
  });

  setTimeout(() => {
    stopTicks(); playWin(data.reward.rarity);
    result.textContent = `UNLOCKED • ${data.reward.amount}x ${data.reward.label}`;
    result.classList.remove('hidden');
    setTimeout(() => {
      app.classList.add('hidden');
      post('finished', { caseName: currentCase });
    }, 1800);
  }, duration);
}

window.addEventListener('message', e => { if (e.data.action === 'open') openCase(e.data); });
document.getElementById('close').onclick = () => { app.classList.add('hidden'); post('close'); };
document.addEventListener('keyup', e => { if (e.key === 'Escape') { app.classList.add('hidden'); post('close'); } });

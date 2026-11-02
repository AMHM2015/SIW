<?php
header('Cache-Control: no-store, no-cache, must-revalidate');
?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="robots" content="noindex,nofollow,noarchive">
<title>SIW Hidden CMS</title>
<style>
:root{--navy:#071b2b;--navy2:#102d46;--blue:#087db8;--line:#dfe7eb;--bg:#eef3f6}
*{box-sizing:border-box}body{margin:0;font-family:Segoe UI,Arial,sans-serif;background:var(--bg);color:#263a46}
button,input,textarea{font:inherit}.login{min-height:100vh;display:grid;place-items:center}.login-card{width:min(380px,calc(100% - 32px));background:white;border:1px solid var(--line);padding:28px;box-shadow:0 18px 50px rgba(7,27,43,.12)}
.login-card h1{margin:0 0 6px;font-family:Georgia,serif;color:var(--navy2)}.login-card p{margin:0 0 20px;color:#71828c;font-size:13px}.login-card label{font-size:12px;font-weight:700}.login-card input{width:100%;height:44px;border:1px solid var(--line);padding:0 12px;margin:7px 0 14px}.primary{border:0;background:var(--blue);color:white;height:40px;padding:0 16px;font-weight:700;cursor:pointer}.danger{border:1px solid #b64c4c;background:white;color:#a13b3b;height:40px;padding:0 14px;cursor:pointer}
.app{display:none;height:100vh}.app.active{display:grid;grid-template-columns:210px minmax(420px,1fr) 300px}.sidebar{background:var(--navy);color:white;padding:18px 12px;overflow:auto}.brand{padding:8px 10px 18px;font-family:Georgia,serif;font-size:18px}.nav-label{font-size:9px;text-transform:uppercase;letter-spacing:.14em;color:#8fa1ae;padding:14px 10px 7px}.page-btn{width:100%;border:0;border-left:3px solid transparent;background:transparent;color:#c5d2da;text-align:left;height:40px;padding:0 10px;cursor:pointer}.page-btn.active{background:#102d46;border-left-color:#35a8dd;color:white}.main{min-width:0;display:grid;grid-template-rows:62px minmax(0,1fr)}.topbar{background:white;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;padding:0 16px}.topbar strong{color:var(--navy2)}.top-actions{display:flex;gap:8px}.top-actions button{height:36px}.preview{background:#cbd6dc;padding:18px;overflow:auto}.preview iframe{width:100%;height:100%;min-height:650px;border:0;background:white;box-shadow:0 4px 18px rgba(7,27,43,.16)}.inspector{background:white;border-left:1px solid var(--line);padding:16px;overflow:auto}.inspector h3{margin:0 0 16px;color:var(--navy2)}.field{margin-bottom:14px}.field label{display:block;font-size:11px;font-weight:800;margin-bottom:6px;color:#536a77}.field input,.field textarea{width:100%;border:1px solid var(--line);padding:9px;background:white}.field textarea{min-height:120px;resize:vertical}.element-list{max-height:220px;overflow:auto;border:1px solid var(--line)}.element-list button{width:100%;border:0;border-bottom:1px solid var(--line);background:white;text-align:left;padding:8px;font-size:11px;cursor:pointer}.element-list button.active{background:#eaf5fa;color:var(--blue)}.notice{position:fixed;right:20px;bottom:20px;background:var(--navy);color:white;padding:12px 16px;font-size:12px;display:none}.notice.show{display:block}.muted{font-size:11px;color:#7c8e98}.hidden{display:none}
.media-modal{position:fixed;inset:0;z-index:100;background:rgba(7,27,43,.72);display:none;place-items:center;padding:20px}.media-modal.active{display:grid}.media-dialog{width:min(980px,100%);height:min(700px,calc(100vh - 40px));background:white;display:grid;grid-template-rows:auto auto minmax(0,1fr)}.media-head{height:64px;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;padding:0 18px}.media-head h2{margin:0;color:var(--navy2)}.media-close{border:1px solid var(--line);background:white;height:36px;width:36px;font-size:20px;cursor:pointer}.media-upload{padding:14px 18px;border-bottom:1px solid var(--line);display:flex;gap:10px;align-items:center}.media-upload input{flex:1}.media-grid{padding:18px;overflow:auto;display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:12px;align-content:start}.media-card{border:1px solid var(--line);min-width:0;background:white}.media-preview{height:140px;background:#edf2f4;display:grid;place-items:center;overflow:hidden}.media-preview img,.media-preview video{width:100%;height:100%;object-fit:cover}.media-info{padding:10px}.media-name{font-size:11px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;margin-bottom:8px}.media-url{width:100%;height:34px;border:1px solid var(--line);padding:0 7px;font-size:10px;margin-bottom:7px}.media-actions{display:flex;gap:6px}.media-actions button{height:34px;flex:1;font-size:11px}.media-empty{grid-column:1/-1;color:#71828c;text-align:center;padding:40px}.media-delete{border:1px solid #b64c4c;background:white;color:#a13b3b;cursor:pointer}
.element-list{max-height:360px}.element-group{border-bottom:1px solid var(--line)}.element-group:last-child{border-bottom:0}.element-group-title{padding:7px 9px;background:#f4f7f8;color:#536a77;font-size:9px;font-weight:800;text-transform:uppercase;letter-spacing:.08em}.element-group button{border-bottom:1px solid #edf2f4}.element-group button:last-child{border-bottom:0}
.dynamic-manager{border:1px solid var(--line);margin-bottom:14px}.dynamic-head{display:flex;justify-content:space-between;align-items:center;padding:9px;border-bottom:1px solid var(--line)}.dynamic-head strong{font-size:11px}.dynamic-row{display:flex;align-items:center;border-bottom:1px solid #edf2f4}.dynamic-row:last-child{border-bottom:0}.dynamic-row button{border:0;background:white;text-align:left;flex:1;padding:9px;font-size:11px;cursor:pointer}.dynamic-row button.active{background:#eaf5fa;color:var(--blue)}.dynamic-row .icon-btn{flex:0;width:34px;text-align:center;color:#536a77}.dynamic-row .delete-item{color:#a13b3b}.dynamic-editor{display:none;border:1px solid var(--line);padding:10px;margin-bottom:14px}.dynamic-editor.active{display:block}.dynamic-editor h4{margin:0 0 10px;color:var(--navy2)}.dynamic-list{max-height:180px;overflow:auto}.add-button{height:32px;border:1px solid var(--blue);background:white;color:var(--blue);padding:0 9px;font-weight:700;cursor:pointer}.section-manager-head{display:flex;justify-content:space-between;align-items:center;padding:9px;border-bottom:1px solid var(--line)}.section-manager-head strong{font-size:11px}.section-actions{display:flex;gap:5px}.section-actions button{height:32px;padding:0 9px;border:1px solid var(--line);background:white;cursor:pointer}.section-actions .add-section{border-color:var(--blue);color:var(--blue);font-weight:700}.custom-section-list{max-height:150px;overflow:auto}.custom-section-row{display:flex;align-items:center;border-bottom:1px solid #edf2f4}.custom-section-row:last-child{border-bottom:0}.custom-section-row button{border:0;background:white;text-align:left;flex:1;padding:9px;font-size:11px;cursor:pointer}.custom-section-row button.active{background:#eaf5fa;color:var(--blue)}.custom-section-row .delete-section,.custom-section-row .move-section{flex:0;width:34px;text-align:center;font-size:13px;color:#536a77}.custom-section-row .delete-section{color:#a13b3b;font-size:16px}.delete-field{border:1px solid #b64c4c;background:white;color:#a13b3b;height:34px;padding:0 10px;cursor:pointer;margin-bottom:10px}.field-row{display:grid;grid-template-columns:1fr 1fr;gap:8px}.format-grid{display:grid;grid-template-columns:1fr 1fr;gap:8px}.format-grid select,.format-grid input{width:100%;height:36px;border:1px solid var(--line);padding:0 7px;background:white}.format-grid label{font-size:10px;font-weight:800;margin-bottom:5px}.section-editor{display:none;border:1px solid var(--line);padding:10px;margin-bottom:14px}.section-editor.active{display:block}.section-editor h4{margin:0 0 10px;color:var(--navy2)}.element-group button{border-bottom:1px solid #edf2f4}.element-group button:last-child{border-bottom:0}
@media(max-width:900px){.app.active{grid-template-columns:150px minmax(280px,1fr) 260px}.preview{padding:8px}}
@media(max-width:720px){.app.active{height:auto;min-height:100vh;display:block}.sidebar{height:auto}.main{height:78vh}.inspector{border-top:1px solid var(--line)}}
@media(max-width:900px){.media-grid{grid-template-columns:repeat(2,minmax(0,1fr))}}
@media(max-width:520px){.media-modal{padding:0}.media-dialog{height:100vh}.media-grid{grid-template-columns:1fr}.media-upload{align-items:stretch;flex-direction:column}.media-upload input,.media-upload button{width:100%}}
</style>
</head>
<body>
<section class="login" id="loginView">
 <form class="login-card" id="loginForm"><h1>SIW CMS</h1><p id="loginHelp">Enter the administrator password.</p><label>Password</label><input id="password" type="password" autocomplete="current-password"><button class="primary" style="width:100%" type="submit">Open CMS</button></form>
</section>
<section class="app" id="appView">
 <aside class="sidebar"><div class="brand">SIW Content</div><div class="nav-label">Website pages</div><div id="pageNav"></div><div class="nav-label">Media</div><button class="page-btn" id="mediaBtn">Media library</button><div class="nav-label">Session</div><button class="page-btn" id="logoutBtn">Sign out</button></aside>
 <main class="main"><header class="topbar"><strong id="pageTitle">Home</strong><div class="top-actions"><button class="danger" id="resetBtn">Reset page</button><button class="primary" id="saveBtn">Save changes</button></div></header><div class="preview"><iframe id="preview" title="Website page preview"></iframe></div></main>
 <aside class="inspector"><h3>Page inspector</h3>
  <div class="dynamic-manager"><div class="dynamic-head"><strong id="dynamicTitle">Dynamic items</strong><button class="add-button" id="addDynamicBtn">+ Add</button></div><div class="dynamic-list" id="dynamicList"><div class="media-empty" style="padding:14px">Select a page with repeatable content</div></div></div>
  <div class="dynamic-editor" id="dynamicEditor"><h4 id="dynamicEditorTitle">Edit item</h4><div class="field"><label>Title / name</label><input id="dynamicTitleField"></div><div class="field"><label>Description / role / details</label><textarea id="dynamicTextField"></textarea></div><div class="field"><label>Image URL</label><input id="dynamicImageField"></div><div class="field"><label>Image alt text</label><input id="dynamicAltField"></div><div class="field"><label>Link URL</label><input id="dynamicLinkField"></div><div class="field"><label>Button / link text</label><input id="dynamicLinkTextField"></div><button class="primary" id="saveDynamicBtn" style="width:100%">Save item</button></div>
  <div class="field"><label id="fieldsLabel">This page's fields</label><div class="element-list" id="elementList"></div></div>
  <div id="editorFields"><button class="delete-field" id="deleteFieldBtn">Delete selected field edit</button>
   <div class="field"><label>Selected text / HTML</label><textarea id="textValue" placeholder="Select a field from this page"></textarea></div>
   <div class="field"><label>Text formatting</label><div class="format-grid">
    <div><label for="fontFamilyValue">Font type</label><select id="fontFamilyValue"><option value="">Default</option><option value="Arial, sans-serif">Arial</option><option value="Georgia, serif">Georgia</option><option value="Times New Roman, serif">Times New Roman</option><option value="Inter, Arial, sans-serif">Inter</option><option value="Segoe UI, Arial, sans-serif">Segoe UI</option><option value="Verdana, sans-serif">Verdana</option><option value="Impact, sans-serif">Impact</option><option value="Courier New, monospace">Courier New</option></select></div>
    <div><label for="fontSizeValue">Font size</label><input id="fontSizeValue" placeholder="e.g. 32px"></div>
    <div><label for="fontWeightValue">Weight</label><select id="fontWeightValue"><option value="">Default</option><option value="300">Light</option><option value="400">Normal</option><option value="500">Medium</option><option value="600">Semi bold</option><option value="700">Bold</option><option value="800">Extra bold</option><option value="900">Black</option></select></div>
    <div><label for="fontStyleValue">Style</label><select id="fontStyleValue"><option value="">Default</option><option value="normal">Normal</option><option value="italic">Italic</option></select></div>
    <div><label for="textAlignValue">Alignment</label><select id="textAlignValue"><option value="">Default</option><option value="left">Left</option><option value="center">Center</option><option value="right">Right</option><option value="justify">Justify</option></select></div>
    <div><label for="textColorValue">Color</label><input id="textColorValue" type="color"></div>
    <div><label for="lineHeightValue">Line height</label><input id="lineHeightValue" placeholder="e.g. 1.5 or 24px"></div>
    <div><label for="textTransformValue">Case</label><select id="textTransformValue"><option value="">Default</option><option value="none">None</option><option value="uppercase">Uppercase</option><option value="lowercase">Lowercase</option><option value="capitalize">Title case</option></select></div>
   </div></div>
   <div class="field"><label>Link URL</label><input id="hrefValue" placeholder="https://..."></div>
   <div class="field"><label>Image URL</label><input id="srcValue" placeholder="hero.avif"></div>
   <div class="field"><label>Image alt text</label><input id="altValue"></div>
   <button class="primary" id="applyBtn" style="width:100%">Apply to preview</button>
  </div><hr style="border:0;border-top:1px solid var(--line);margin:18px 0"><h3>SEO</h3><div class="field"><label>Browser title</label><input id="seoTitle"></div><div class="field"><label>Meta description</label><textarea id="seoDescription" style="min-height:80px"></textarea></div></aside>
</section>
<section class="media-modal" id="mediaModal" aria-hidden="true">
 <div class="media-dialog">
  <header class="media-head"><div><small class="muted">Upload and copy public URLs</small><h2>Media library</h2></div><button class="media-close" id="mediaClose" aria-label="Close">&times;</button></header>
  <div class="media-upload"><input id="mediaFile" type="file" accept="image/jpeg,image/png,image/gif,image/webp,image/avif,video/mp4,video/webm,video/quicktime"><button class="primary" id="mediaUploadBtn">Upload</button></div>
  <div class="media-grid" id="mediaGrid"><div class="media-empty">Loading media...</div></div>
 </div>
</section>
<div class="notice" id="notice"></div>
<script>
const pages=[['home','Home','index.html'],['about','About Us','about.html'],['brochure','Brochure','brochure.html'],['career','Career','career.html'],['certifications','Certifications','certifications.html'],['clients','Clients','clients.html'],['news','News','news.html'],['products','Products','products.html'],['services','Services','services.html'],['team','Team','team.html']];
let current='home',allData={},pageEdits={},selected=null,elementItems=[],selectedDynamic=null;
const dynamicConfig={
 products:{container:'.catalog-grid',item:'.catalog-card',singular:'Product',plural:'Products'},
 clients:{container:'.clients-grid',item:'.client-card',singular:'Client',plural:'Clients'},
 news:{container:'.news-card-grid',item:'.news-card',singular:'News item',plural:'News'},
 career:{container:'.functions-grid',item:'.function-card',singular:'Career function',plural:'Career functions'},
 team:{container:null,item:'.top-person, .directory-row',singular:'Team member',plural:'Team members'},
 certifications:{container:null,item:'.cert-new-row',singular:'Certification',plural:'Certifications'},
 services:{container:null,item:'.service-card',singular:'Service',plural:'Services'}
};
const $=id=>document.getElementById(id);
function notify(message){$('notice').textContent=message;$('notice').classList.add('show');setTimeout(()=>$('notice').classList.remove('show'),2200)}
async function api(action,options={}){
 options.credentials='same-origin';
 options.cache='no-store';
 const response=await fetch('cms-api.php?action='+encodeURIComponent(action),options);
 let data={};try{data=await response.json()}catch(_){}
 if(!response.ok)throw new Error(data.error||'Request failed');
 return data;
}
async function initialize(){
 try{
  const status=await api('status');
  if(!status.configured){$('loginHelp').textContent='Create the first administrator password (8+ characters).'}
  $('loginForm').onsubmit=async event=>{
   event.preventDefault();
   const button=event.submitter||$('loginForm').querySelector('button');
   button.disabled=true;
   try{
    await api(status.configured?'login':'setup',{method:'POST',headers:{'Content-Type':'application/json','Cache-Control':'no-store'},body:JSON.stringify({password:$('password').value})});
    showApp();
   }catch(error){$('loginHelp').textContent=error.message;notify(error.message)}
   finally{button.disabled=false}
  };
  if(status.authenticated)showApp();
 }catch(error){$('loginHelp').textContent='CMS API unavailable: '+error.message}
}
function stableSelector(el){
 if(el.id)return '#'+CSS.escape(el.id);
 const parts=[];let node=el;
 while(node&&node.nodeType===1&&node.tagName.toLowerCase()!=='html'){
  let name=node.tagName.toLowerCase();
  if(node.id){parts.unshift('#'+CSS.escape(node.id));break}
  let sibling=node.parentElement?node.parentElement.firstElementChild:null,count=1;
  while(sibling&&sibling!==node){if(sibling.tagName===node.tagName)count++;sibling=sibling.nextElementSibling}
  let total=Array.from(node.parentElement?node.parentElement.children:[]).filter(x=>x.tagName===node.tagName).length;
  if(total>1)name+=`:nth-of-type(${count})`;
  parts.unshift(name);node=node.parentElement;if(parts.length>4)break;
 }
 return parts.join(' > ');
}
function showApp(){
 $('loginView').classList.add('hidden');$('appView').classList.add('active');
 $('pageNav').innerHTML=pages.map(p=>`<button class="page-btn" data-page="${p[0]}">${p[1]}</button>`).join('');
 document.querySelectorAll('.page-btn[data-page]').forEach(btn=>btn.onclick=()=>selectPage(btn.dataset.page));
 $('logoutBtn').onclick=async()=>{
  try{await api('logout',{method:'GET',headers:{'Cache-Control':'no-store'}})}catch(error){/* Logout UI still resets locally. */}
  $('appView').classList.remove('active');$('loginView').classList.remove('hidden');$('password').value='';$('loginHelp').textContent='Enter the administrator password.';
 };
 $('mediaBtn').onclick=openMedia;$('mediaClose').onclick=closeMedia;$('mediaUploadBtn').onclick=uploadMedia;
 $('mediaModal').onclick=event=>{if(event.target===$('mediaModal'))closeMedia()};
 $('addDynamicBtn').onclick=addDynamic;$('saveDynamicBtn').onclick=saveDynamic;$('deleteFieldBtn').onclick=deleteFieldEdit;
 document.addEventListener('keydown',event=>{if(event.key==='Escape')closeMedia()});
 $('saveBtn').onclick=savePage;$('resetBtn').onclick=resetPage;$('applyBtn').onclick=applyEdit;$('preview').onload=()=>{scanPreview();setTimeout(scanPreview,200);setTimeout(scanPreview,700)};
 selectPage(current);
}
async function selectPage(page){
 current=page;
 const item=pages.find(p=>p[0]===page);$('pageTitle').textContent=item[1];
 document.querySelectorAll('.page-btn[data-page]').forEach(b=>b.classList.toggle('active',b.dataset.page===page));
 $('preview').src=item[2];
 try{allData=await api('public')}catch(error){notify(error.message)}
 pageEdits=JSON.parse(JSON.stringify((allData&&allData[page])||{}));
 selectedDynamic=null;$('dynamicEditor').classList.remove('active');
 ensureCollectionFromPreview();renderDynamicItems();
 scanPreview();
}
function scanPreview(){
 let doc;try{doc=$('preview').contentDocument}catch(_){return}if(!doc)return;
 ensureCollectionFromPreview();renderDynamicItems();
 const original=(allData[current]||{}).__seo||{};
 $('seoTitle').value=original.title||doc.title||'';
 $('seoDescription').value=original.description||(doc.querySelector('meta[name="description"]')?.content||'');
 const visualSelector='img,video,picture,source,[style*="background-image"],[class*="hero-bg"],[class*="catalog-visual"],[class*="product-placeholder"],[class*="product-image"],[class*="products-hero-bg"]';
 const images=Array.from(doc.querySelectorAll(visualSelector)).filter(el=>{
  if(!el.offsetParent) return false;
  if(el.closest('script,style,header,nav,footer,.site-header,.site-footer')) return false;
  return el.tagName==='IMG'||el.tagName==='VIDEO'||el.tagName==='PICTURE'||el.tagName==='SOURCE'||typeof el.className==='string'||el.style.backgroundImage;
 }).filter((el,index,array)=>array.indexOf(el)===index);
 const content=Array.from(doc.querySelectorAll('h1,h2,h3,h4,p,a,button,blockquote,figcaption,td')).filter(el=>{
  return el.offsetParent!==null&&!el.closest('script,style,header,nav,footer,.site-header,.site-footer')&&!el.querySelector('img,h1,h2,h3,h4,p,a,button');
 });
 elementItems=[];
 const contentStart=elementItems.length;
 content.forEach(el=>elementItems.push(el));
 const imageStart=elementItems.length;
 images.forEach(el=>elementItems.push(el));
 function renderItems(items,label,imageGroup){
  if(!items.length)return '';
  const buttons=items.map(el=>{
   const index=elementItems.indexOf(el);
   const classLabel=typeof el.className==='string'?el.className.trim().replace(/\s+/g,' ').slice(0,45):'';
   let name=imageGroup?`${el.tagName==='IMG'?'Image':'Visual'}: ${el.getAttribute('alt')||el.getAttribute('src')||classLabel||'Untitled'}`:(el.textContent||'').trim().replace(/\s+/g,' ').slice(0,58)||el.tagName;
   return `<button data-index="${index}">${escapeHtml(name)}</button>`;
  }).join('');
  return `<div class="element-group"><div class="element-group-title">${label} (${items.length})</div>${buttons}</div>`;
 }
 $('elementList').innerHTML=renderItems(content,'Text and links',false)+renderItems(images,'Images',true)||'<div class="media-empty">No editable fields found on this page.</div>';
 $('fieldsLabel').textContent='Fields on '+($('pageTitle').textContent||'this page');
 elementItems.forEach((el,i)=>{el.style.outline='none';el.addEventListener('click',event=>{event.preventDefault();event.stopPropagation();chooseElement(i)},true)});
 document.querySelectorAll('#elementList button').forEach(btn=>btn.onclick=()=>chooseElement(Number(btn.dataset.index)));
 $('elementList').querySelector('button')?.click();
}
function chooseElement(index){
 selected=elementItems[index];if(!selected)return;
 elementItems.forEach(el=>el.style.outline='');
 selected.style.outline='2px solid #087db8';
 document.querySelectorAll('#elementList button').forEach(b=>b.classList.toggle('active',Number(b.dataset.index)===index));
 const selector=stableSelector(selected),stored=pageEdits[selector]||{};
 const computed=selected.ownerDocument.defaultView.getComputedStyle(selected);
 $('textValue').value=typeof stored.text==='string'?stored.text:selected.textContent.trim();
 $('hrefValue').value=typeof stored.href==='string'?stored.href:(selected.getAttribute('href')||'');
 const computedBackground=selected.ownerDocument.defaultView.getComputedStyle(selected).backgroundImage;
 const backgroundUrl=stored.backgroundImage||(/^url\(["']?(.*?)["']?\)$/i.test(computedBackground)?RegExp.$1:'');
 $('srcValue').value=typeof stored.src==='string'?stored.src:(selected.getAttribute('src')||backgroundUrl||'');
 $('altValue').value=typeof stored.alt==='string'?stored.alt:(selected.getAttribute('alt')||'');
 $('fontFamilyValue').value=stored.fontFamily||'';
 $('fontSizeValue').value=stored.fontSize||computed.fontSize||'';
 $('fontWeightValue').value=stored.fontWeight||'';
 $('fontStyleValue').value=stored.fontStyle||'';
 $('textAlignValue').value=stored.textAlign||'';
 $('lineHeightValue').value=stored.lineHeight||computed.lineHeight||'';
 $('textTransformValue').value=stored.textTransform||'';
 const rgb=computed.color.match(/\d+/g);
 $('textColorValue').value=rgb&&rgb.length>=3?'#'+rgb.slice(0,3).map(v=>Number(v).toString(16).padStart(2,'0')).join(''):(stored.color||'#000000');
 selected.dataset.cmsSelector=selector;
}
function applyEdit(){
 if(!selected)return notify('Select an element first');
 const selector=stableSelector(selected),value={};
 if(selected.tagName==='IMG'){
  if($('srcValue').value.trim())value.src=$('srcValue').value.trim();
  value.alt=$('altValue').value;
 }else if(selected.tagName==='VIDEO'){
  if($('srcValue').value.trim())value.src=$('srcValue').value.trim();
 }else{
  const src=$('srcValue').value.trim();
  const hasBackground=selected.className&&typeof selected.className==='string'&&(
   /(?:hero-bg|catalog-visual|product-placeholder|product-image)/i.test(selected.className)||
   selected.ownerDocument.defaultView.getComputedStyle(selected).backgroundImage!=='none'
  );
  if(hasBackground&&src){
   value.backgroundImage=src;
   selected.style.backgroundImage='url("'+src.replace(/"/g,'%22')+'")';
   selected.style.backgroundSize='cover';
   selected.style.backgroundPosition='center';
  }
  value.text=$('textValue').value;
  value.fontFamily=$('fontFamilyValue').value;
  value.fontSize=$('fontSizeValue').value.trim();
  value.fontWeight=$('fontWeightValue').value;
  value.fontStyle=$('fontStyleValue').value;
  value.textAlign=$('textAlignValue').value;
  value.color=$('textColorValue').value;
  value.lineHeight=$('lineHeightValue').value.trim();
  value.textTransform=$('textTransformValue').value;
  selected.style.fontFamily=value.fontFamily||'';
  selected.style.fontSize=value.fontSize||'';
  selected.style.fontWeight=value.fontWeight||'';
  selected.style.fontStyle=value.fontStyle||'';
  selected.style.textAlign=value.textAlign||'';
  selected.style.color=value.color||'';
  selected.style.lineHeight=value.lineHeight||'';
  selected.style.textTransform=value.textTransform||'';
  if(selected.tagName==='A'||selected.hasAttribute('href'))value.href=$('hrefValue').value.trim();
 }
 pageEdits[selector]=value;
 if(value.text!==undefined)selected.textContent=value.text;
 if(value.href!==undefined)selected.setAttribute('href',value.href);
 if(value.src!==undefined)selected.setAttribute('src',value.src);
 if(value.alt!==undefined)selected.setAttribute('alt',value.alt);
 notify('Applied in preview. Save to publish.');
}
async function savePage(){
 try{
  await api('save-page',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({page:current,elements:pageEdits})});
  await api('save-seo',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({page:current,title:$('seoTitle').value,description:$('seoDescription').value})});
  allData[current]=pageEdits;
  $('preview').src=$('preview').src;
  notify('Changes saved');
 }catch(error){notify(error.message)}
}
async function resetPage(){
 if(!confirm('Reset this page to its original website content?'))return;
 try{await api('reset-page',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({page:current})});pageEdits={};$('preview').src=$('preview').src;notify('Page reset')}catch(error){notify(error.message)}
}
function escapeHtml(value){return String(value).replace(/[&<>"']/g,m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'}[m]))}
function getCollection(){const value=pageEdits.__collection;return value&&Array.isArray(value.items)?value:{config:null,items:[]}}
function currentDynamicConfig(){return dynamicConfig[current]||null}
function itemFields(el){
 const heading=el.querySelector('h1,h2,h3,h4,strong');
 const text=el.querySelector('p,.role-title');
 const image=el.querySelector('img');
 const link=el.querySelector('.news-card-actions a, .service-link, a[href]:not(.news-card-image):not(.service-image)')||el.querySelector('a');
 const parent=el.parentElement;
 const parentSelector=parent?stableSelector(parent):'';
 return {title:(heading?heading.textContent:text?text.textContent:image?image.alt:'').trim().replace(/\s+/g,' '),text:text?text.textContent.trim().replace(/\s+/g,' '):'',image:image?image.getAttribute('src')||'':'',alt:image?image.getAttribute('alt')||'':'',link:link?link.getAttribute('href')||'':'',linkText:link?link.textContent.trim().replace(/\s+/g,' '):'',container:parentSelector,template:el.cloneNode(true).outerHTML};
}
function renderDynamicItems(){
 const config=currentDynamicConfig(),collection=getCollection();$('dynamicTitle').textContent=config?config.plural:'Dynamic items';
 if(!config){$('dynamicList').innerHTML='<div class="media-empty" style="padding:14px">No repeatable collection on this page</div>';$('addDynamicBtn').disabled=true;return}
 $('addDynamicBtn').disabled=false;
 if(!collection.items.length){$('dynamicList').innerHTML=`<div class="media-empty" style="padding:14px">No ${config.plural.toLowerCase()}</div>`}
 else $('dynamicList').innerHTML=collection.items.map((item,index)=>`<div class="dynamic-row"><button data-dynamic="${index}" class="${selectedDynamic===index?'active':''}">${escapeHtml(item.title||item.alt||config.singular+' '+(index+1))}</button><button class="icon-btn" data-dynamic-up="${index}" title="Move up">&#9650;</button><button class="icon-btn" data-dynamic-down="${index}" title="Move down">&#9660;</button><button class="icon-btn delete-item" data-dynamic-delete="${index}" title="Delete">&times;</button></div>`).join('');
 document.querySelectorAll('[data-dynamic]').forEach(button=>button.onclick=()=>editDynamic(Number(button.dataset.dynamic)));
 document.querySelectorAll('[data-dynamic-up]').forEach(button=>button.onclick=()=>moveDynamic(Number(button.dataset.dynamicUp),-1));
 document.querySelectorAll('[data-dynamic-down]').forEach(button=>button.onclick=()=>moveDynamic(Number(button.dataset.dynamicDown),1));
 document.querySelectorAll('[data-dynamic-delete]').forEach(button=>button.onclick=()=>deleteDynamic(Number(button.dataset.dynamicDelete)));
}
function ensureCollectionFromPreview(){
 const config=currentDynamicConfig(),collection=getCollection();
 if(config&&collection.config===current)return collection;
 const doc=$('preview').contentDocument;if(!doc)return {config:null,items:[]};
 if(!config)return {config:null,items:[]};
 const nodes=Array.from(doc.querySelectorAll(config.item)).filter(el=>!el.closest('header,footer,nav,script,style'));
 const items=nodes.map(itemFields);
 pageEdits.__collection={config:current,container:config.container,item:config.item,items};
 return pageEdits.__collection;
}
function applyCollectionToPreview(){
 const collection=getCollection(),doc=$('preview').contentDocument;if(!doc||!collection.items)return;
 const config=currentDynamicConfig();if(!config)return;
 Array.from(doc.querySelectorAll(config.item)).forEach(item=>item.remove());
 collection.items.forEach(itemData=>{
  let container=null;
  if(collection.container)container=doc.querySelector(collection.container);
  if(!container&&itemData.container){try{container=doc.querySelector(itemData.container)}catch(_){container=null}}
  if(!container&&collection.items.length===1)container=null;
  if(!container){
   const existing=Array.from(doc.querySelectorAll(config.item)).find(Boolean);
   container=existing?.parentElement||null;
  }
  if(!container)return;
  const holder=doc.createElement('div');
  holder.innerHTML=itemData.template||'';
  const item=holder.firstElementChild;if(!item)return;
  const title=item.querySelector('h1,h2,h3,h4,strong');
  const text=item.querySelector('p,.role-title');
  const image=item.querySelector('img');
  const link=item.querySelector('.news-card-actions a, .service-link, a[href]:not(.news-card-image):not(.service-image)')||item.querySelector('a');
  if(title&&typeof itemData.title==='string')title.textContent=itemData.title;
  if(text&&typeof itemData.text==='string')text.textContent=itemData.text;
  if(image&&typeof itemData.image==='string')image.setAttribute('src',itemData.image);
  if(image&&typeof itemData.alt==='string')image.setAttribute('alt',itemData.alt);
  if(link&&typeof itemData.link==='string')link.setAttribute('href',itemData.link);
  if(link&&typeof itemData.linkText==='string')link.textContent=itemData.linkText;
  container.appendChild(item);
 });
}
function addDynamic(){
 const config=currentDynamicConfig();if(!config)return;
 const collection=ensureCollectionFromPreview(),template=collection.items[0]?collection.items[0].template:null;
 const item={title:'New '+config.singular.toLowerCase(),text:'Add description here.',image:'',alt:'',link:'#',linkText:'View',container:collection.items[0]?.container||'',template:template||''};
 collection.items.push(item);pageEdits.__collection=collection;selectedDynamic=collection.items.length-1;renderDynamicItems();editDynamic(selectedDynamic);applyCollectionToPreview();notify(config.singular+' added. Save changes to publish.');
}
function editDynamic(index){
 const collection=getCollection(),item=collection.items[index];if(!item)return;
 selectedDynamic=index;$('dynamicEditor').classList.add('active');$('dynamicEditorTitle').textContent='Edit '+(dynamicConfig[current]?.singular||'item');
 $('dynamicTitleField').value=item.title||'';$('dynamicTextField').value=item.text||'';$('dynamicImageField').value=item.image||'';$('dynamicAltField').value=item.alt||'';$('dynamicLinkField').value=item.link||'';$('dynamicLinkTextField').value=item.linkText||'';
 renderDynamicItems();
}
function saveDynamic(){
 const collection=getCollection();if(selectedDynamic===null||!collection.items[selectedDynamic])return notify('Select or add an item first');
 Object.assign(collection.items[selectedDynamic],{title:$('dynamicTitleField').value,text:$('dynamicTextField').value,image:$('dynamicImageField').value,alt:$('dynamicAltField').value,link:$('dynamicLinkField').value,linkText:$('dynamicLinkTextField').value});
 pageEdits.__collection=collection;renderDynamicItems();applyCollectionToPreview();notify('Item updated. Save changes to publish.');
}
function deleteDynamic(index){
 if(!confirm('Delete this item permanently from the page?'))return;
 const collection=getCollection();collection.items.splice(index,1);pageEdits.__collection=collection;selectedDynamic=null;$('dynamicEditor').classList.remove('active');renderDynamicItems();applyCollectionToPreview();notify('Item removed. Save changes to publish.');
}
function moveDynamic(index,offset){
 const collection=getCollection(),target=index+offset;if(target<0||target>=collection.items.length)return;
 const item=collection.items.splice(index,1)[0];collection.items.splice(target,0,item);pageEdits.__collection=collection;selectedDynamic=target;renderDynamicItems();applyCollectionToPreview();notify('Item order changed. Save changes to publish.');
}
function deleteFieldEdit(){
 if(!selected)return notify('Select a field first');
 const selector=stableSelector(selected);delete pageEdits[selector];$('preview').src=$('preview').src;notify('Field edit removed. Save changes to publish.');
}
function publicMediaUrl(relativeUrl){return new URL(relativeUrl,window.location.href).href}
function openMedia(){ $('mediaModal').classList.add('active');$('mediaModal').setAttribute('aria-hidden','false');loadMedia()}
function closeMedia(){ $('mediaModal').classList.remove('active');$('mediaModal').setAttribute('aria-hidden','true')}
async function loadMedia(){
 $('mediaGrid').innerHTML='<div class="media-empty">Loading media...</div>';
 try{
  const result=await api('media-list');
  if(!result.files.length){$('mediaGrid').innerHTML='<div class="media-empty">No uploaded media yet.</div>';return}
  $('mediaGrid').innerHTML=result.files.map(file=>{
   const url=publicMediaUrl(file.url),isVideo=/\.(mp4|webm|mov)$/i.test(file.url);
   const preview=isVideo?`<video src="${escapeHtml(url)}" muted></video>`:`<img src="${escapeHtml(url)}" alt="">`;
   return `<article class="media-card"><div class="media-preview">${preview}</div><div class="media-info"><div class="media-name" title="${escapeHtml(file.name)}">${escapeHtml(file.name)}</div><input class="media-url" readonly value="${escapeHtml(url)}"><div class="media-actions"><button class="primary" data-copy="${escapeHtml(file.url)}">Copy URL</button><button class="media-delete" data-delete="${escapeHtml(file.name)}">Delete</button></div></div></article>`;
  }).join('');
  document.querySelectorAll('[data-copy]').forEach(button=>button.onclick=()=>copyMediaUrl(button.dataset.copy,button));
  document.querySelectorAll('[data-delete]').forEach(button=>button.onclick=()=>deleteMedia(button.dataset.delete));
 }catch(error){$('mediaGrid').innerHTML=`<div class="media-empty">${escapeHtml(error.message)}</div>`}
}
async function uploadMedia(){
 const input=$('mediaFile');
 if(!input.files.length)return notify('Choose an image or video first');
 const form=new FormData();form.append('file',input.files[0]);
 $('mediaUploadBtn').disabled=true;$('mediaUploadBtn').textContent='Uploading...';
 try{
  const response=await fetch('cms-api.php?action=media-upload',{method:'POST',body:form,credentials:'same-origin'});
  const result=await response.json();if(!response.ok)throw new Error(result.error||'Upload failed');
  input.value='';notify('Media uploaded');loadMedia();
 }catch(error){notify(error.message)}finally{$('mediaUploadBtn').disabled=false;$('mediaUploadBtn').textContent='Upload'}
}
async function copyMediaUrl(relativeUrl,button){
 const url=publicMediaUrl(relativeUrl);
 try{await navigator.clipboard.writeText(url);button.textContent='Copied!';setTimeout(()=>button.textContent='Copy URL',1500)}
 catch(_){const field=document.createElement('textarea');field.value=url;document.body.appendChild(field);field.select();document.execCommand('copy');field.remove();button.textContent='Copied!';setTimeout(()=>button.textContent='Copy URL',1500)}
}
async function deleteMedia(name){
 if(!confirm('Delete this uploaded file?'))return;
 try{await api('media-delete',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({name})});notify('Media deleted');loadMedia()}catch(error){notify(error.message)}
}
initialize();
</script>
</body>
</html>


(function(){
  function init(){
    var menu=document.querySelector('.siw-shared-menu');
    var links=document.querySelector('.siw-shared-links');
    if(menu&&links&&!menu.dataset.bound){
      menu.dataset.bound='1';
      menu.addEventListener('click',function(){links.classList.toggle('open');});
    }
    document.querySelectorAll('.siw-shared-drop-btn').forEach(function(btn){
      if(btn.dataset.bound)return; btn.dataset.bound='1';
      btn.addEventListener('click',function(){
        if(window.innerWidth<=900){btn.parentElement.classList.toggle('mobile-open');}
      });
    });
  }
  if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',init); else init();
})();

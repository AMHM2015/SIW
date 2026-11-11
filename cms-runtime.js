(function () {
    const page = window.location.pathname.split('/').pop().replace(/\.html$/i, '').toLowerCase() || 'index';
    const key = page === 'index' ? 'home' : page;

    const applyContent = function (data) {
        const pageData = data[key] || {};
        Object.keys(pageData).forEach(function (selector) {
            if (selector === '__seo' || selector === '__sections' || selector === '__collection') return;
            let element;
            try { element = document.querySelector(selector); } catch (_) { return; }
            if (!element) return;
            const value = pageData[selector];
            if (value && typeof value.text === 'string') element.textContent = value.text;
            if (value && typeof value.html === 'string') element.innerHTML = value.html;
            if (value && typeof value.fontFamily === 'string') element.style.fontFamily = value.fontFamily;
            if (value && typeof value.fontSize === 'string') element.style.fontSize = value.fontSize;
            if (value && typeof value.fontWeight === 'string') element.style.fontWeight = value.fontWeight;
            if (value && typeof value.fontStyle === 'string') element.style.fontStyle = value.fontStyle;
            if (value && typeof value.textAlign === 'string') element.style.textAlign = value.textAlign;
            if (value && typeof value.color === 'string') element.style.color = value.color;
            if (value && typeof value.lineHeight === 'string') element.style.lineHeight = value.lineHeight;
            if (value && typeof value.textTransform === 'string') element.style.textTransform = value.textTransform;
            if (value && typeof value.href === 'string') element.setAttribute('href', value.href);
            if (value && typeof value.src === 'string') element.setAttribute('src', value.src);
            if (value && typeof value.alt === 'string') element.setAttribute('alt', value.alt);
            if (value && typeof value.backgroundImage === 'string' && value.backgroundImage) {
                element.style.backgroundImage = 'url("' + value.backgroundImage.replace(/"/g, '%22') + '")';
                element.style.backgroundSize = 'cover';
                element.style.backgroundPosition = 'center';
            }
        });

        if (pageData.__seo) {
            if (pageData.__seo.title) document.title = pageData.__seo.title;
            if (pageData.__seo.description) {
                let meta = document.querySelector('meta[name="description"]');
                if (!meta) {
                    meta = document.createElement('meta');
                    meta.name = 'description';
                    document.head.appendChild(meta);
                }
                meta.content = pageData.__seo.description;
            }
        }

        if (pageData.__collection && Array.isArray(pageData.__collection.items)
            && !(pageData.__collection.config === 'about' && pageData.__collection.items.length === 0)) {
            const collection = pageData.__collection;
            const itemSelector = collection.item || '';
            const firstItem = itemSelector ? document.querySelector(itemSelector) : null;
            if (firstItem) {
                const template = collection.items[0] && collection.items[0].template
                    ? collection.items[0].template
                    : firstItem.outerHTML;
                const container = firstItem.parentElement;
                if (container) {
                    document.querySelectorAll(itemSelector).forEach(function (item) {
                        item.remove();
                    });
                    collection.items.forEach(function (itemData) {
                        const holder = document.createElement('div');
                        holder.innerHTML = itemData.template || template;
                        const item = holder.firstElementChild;
                        if (!item) return;
                        if (collection.config === 'about' && !item.querySelector('.team-card-position')) {
                            const position = document.createElement('div');
                            position.className = 'team-card-position';
                            item.prepend(position);
                        }
                        let target = null;
                        if (collection.container) {
                            try { target = document.querySelector(collection.container); } catch (_) {}
                        }
                        if (!target && itemData.container) {
                            try { target = document.querySelector(itemData.container); } catch (_) {}
                        }
                        if (!target) target = container;
                        const title = item.querySelector('h1,h2,h3,h4,strong');
                        const text = item.querySelector('.team-card-position,p,.role-title');
                        const image = item.querySelector('img');
                        const link = item.querySelector('.news-card-actions a, .service-link, a[href]:not(.news-card-image):not(.service-image)') || item.querySelector('a');
                        if (title && typeof itemData.title === 'string') title.textContent = itemData.title;
                        if (text && typeof itemData.text === 'string') text.textContent = itemData.text;
                        if (image) {
                            if (typeof itemData.image === 'string' && itemData.image) image.setAttribute('src', itemData.image);
                            if (typeof itemData.alt === 'string') image.setAttribute('alt', itemData.alt);
                        }
                        if (link) {
                            if (typeof itemData.link === 'string' && itemData.link) link.setAttribute('href', itemData.link);
                            if (typeof itemData.linkText === 'string' && itemData.linkText) link.textContent = itemData.linkText;
                        }
                        target.appendChild(item);
                    });
                }
            }
        }

        if (Array.isArray(pageData.__sections)) {
            document.querySelectorAll('[data-siw-cms-section]').forEach(function (section) {
                section.remove();
            });
            let host = document.querySelector('main') || document.querySelector('[role="main"]') || document.body;
            pageData.__sections.forEach(function (section) {
                const wrapper = document.createElement('section');
                wrapper.setAttribute('data-siw-cms-section', section.id || '');
                wrapper.style.cssText = 'box-sizing:border-box;padding:70px 24px;background:#fff;color:#102d46;border-top:1px solid #dfe7eb;';
                const image = typeof section.image === 'string' ? section.image : '';
                const alt = typeof section.alt === 'string' ? section.alt : '';
                const title = typeof section.title === 'string' ? section.title : '';
                const body = typeof section.body === 'string' ? section.body : '';
                const button = typeof section.button === 'string' ? section.button : '';
                const link = typeof section.link === 'string' ? section.link : '#';
                const layout = typeof section.layout === 'string' ? section.layout : 'image-right';
                const imageMarkup = image ? '<img src="' + image.replace(/"/g, '%22') + '" alt="' + alt.replace(/"/g, '&quot;') + '" style="width:100%;max-height:520px;object-fit:cover;">' : '';
                const buttonMarkup = button ? '<a href="' + link.replace(/"/g, '%22') + '" style="display:inline-block;margin-top:20px;padding:13px 18px;background:#087db8;color:#fff;text-decoration:none;font-weight:700;">' + button.replace(/</g, '&lt;').replace(/>/g, '&gt;') + '</a>' : '';
                const textMarkup = '<div><h2 style="margin:0 0 16px;font-size:clamp(28px,4vw,48px);">' + title.replace(/</g, '&lt;').replace(/>/g, '&gt;') + '</h2><p style="margin:0;line-height:1.8;white-space:pre-line;">' + body.replace(/</g, '&lt;').replace(/>/g, '&gt;') + '</p>' + buttonMarkup + '</div>';
                const gridStyle = layout === 'text-only' ? 'max-width:900px;margin:auto;' : 'max-width:1180px;margin:auto;display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:44px;align-items:center;';
                let contentMarkup = '<div style="' + gridStyle + '">' + textMarkup;
                if (layout === 'image-left') contentMarkup += imageMarkup;
                if (layout === 'image-right') contentMarkup += imageMarkup ? imageMarkup : '';
                if (layout === 'image-top') contentMarkup = '<div style="max-width:1180px;margin:auto;">' + (imageMarkup ? imageMarkup + '<div style="margin-top:24px">' : '<div>') + textMarkup.replace(/^<div>|<\/div>$/g, '') + '</div></div>';
                if (layout !== 'image-top') contentMarkup += '</div>';
                if (layout === 'image-left') contentMarkup = '<div style="' + gridStyle + '">' + imageMarkup + textMarkup + '</div>';
                wrapper.innerHTML = contentMarkup;
                const footer = host.querySelector('footer');
                if (footer) host.insertBefore(wrapper, footer);
                else host.appendChild(wrapper);
            });
        }
    };

    if (window.SIW_CMS_DATA && typeof window.SIW_CMS_DATA === 'object') {
        applyContent(window.SIW_CMS_DATA);
        return;
    }

    fetch('cms-api.php?action=public&v=' + Date.now(), { credentials: 'same-origin', cache: 'no-store' })
        .then(function (response) {
            if (!response.ok) throw new Error('CMS unavailable');
            return response.json();
        })
        .then(applyContent)
        .catch(function () {});
})();

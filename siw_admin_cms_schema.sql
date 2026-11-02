BEGIN TRANSACTION;
CREATE TABLE audit_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    external_user_id TEXT,
    external_user_email TEXT,
    action TEXT NOT NULL,
    entity_type TEXT NOT NULL,
    entity_id INTEGER,
    old_value_json TEXT,
    new_value_json TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE content_fields (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    section_id INTEGER NOT NULL,
    field_key TEXT NOT NULL,
    label TEXT NOT NULL,
    field_type TEXT NOT NULL DEFAULT 'text',
    value_text TEXT,
    value_json TEXT,
    settings_json TEXT NOT NULL DEFAULT '{}',
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_editable INTEGER NOT NULL DEFAULT 1,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(section_id, field_key),
    FOREIGN KEY(section_id) REFERENCES sections(id) ON DELETE CASCADE
);
INSERT INTO "content_fields" VALUES(1,1,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(2,1,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(3,1,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(4,1,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(5,1,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(6,1,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(7,1,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(8,1,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(9,2,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(10,2,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(11,2,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(12,2,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(13,2,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(14,2,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(15,2,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(16,2,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(17,3,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(18,3,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(19,3,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(20,3,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(21,3,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(22,3,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(23,3,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(24,3,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(25,4,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(26,4,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(27,4,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(28,4,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(29,4,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(30,4,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(31,4,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(32,4,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(33,5,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(34,5,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(35,5,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(36,5,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(37,5,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(38,5,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(39,5,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(40,5,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(41,6,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(42,6,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(43,6,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(44,6,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(45,6,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(46,6,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(47,6,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(48,6,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(49,7,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(50,7,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(51,7,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(52,7,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(53,7,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(54,7,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(55,7,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(56,7,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(57,8,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(58,8,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(59,8,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(60,8,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(61,8,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(62,8,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(63,8,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(64,8,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(65,9,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(66,9,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(67,9,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(68,9,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(69,9,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(70,9,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(71,9,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(72,9,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(73,10,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(74,10,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(75,10,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(76,10,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(77,10,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(78,10,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(79,10,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(80,10,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(81,11,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(82,11,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(83,11,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(84,11,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(85,11,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(86,11,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(87,11,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(88,11,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(89,12,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(90,12,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(91,12,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(92,12,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(93,12,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(94,12,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(95,12,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(96,12,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(97,13,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(98,13,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(99,13,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(100,13,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(101,13,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(102,13,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(103,13,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(104,13,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(105,14,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(106,14,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(107,14,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(108,14,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(109,14,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(110,14,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(111,14,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(112,14,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(113,15,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(114,15,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(115,15,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(116,15,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(117,15,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(118,15,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(119,15,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(120,15,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(121,16,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(122,16,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(123,16,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(124,16,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(125,16,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(126,16,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(127,16,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(128,16,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(129,17,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(130,17,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(131,17,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(132,17,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(133,17,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(134,17,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(135,17,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(136,17,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(137,18,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(138,18,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(139,18,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(140,18,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(141,18,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(142,18,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(143,18,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(144,18,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(145,19,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(146,19,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(147,19,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(148,19,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(149,19,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(150,19,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(151,19,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(152,19,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(153,20,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(154,20,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(155,20,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(156,20,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(157,20,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(158,20,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(159,20,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(160,20,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(161,21,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(162,21,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(163,21,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(164,21,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(165,21,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(166,21,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(167,21,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(168,21,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(169,22,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(170,22,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(171,22,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(172,22,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(173,22,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(174,22,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(175,22,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(176,22,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(177,23,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(178,23,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(179,23,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(180,23,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(181,23,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(182,23,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(183,23,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(184,23,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(185,24,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(186,24,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(187,24,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(188,24,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(189,24,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(190,24,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(191,24,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(192,24,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(193,25,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(194,25,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(195,25,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(196,25,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(197,25,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(198,25,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(199,25,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(200,25,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(201,26,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(202,26,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(203,26,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(204,26,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(205,26,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(206,26,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(207,26,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(208,26,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(209,27,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(210,27,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(211,27,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(212,27,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(213,27,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(214,27,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(215,27,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(216,27,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(217,28,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(218,28,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(219,28,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(220,28,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(221,28,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(222,28,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(223,28,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(224,28,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(225,29,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(226,29,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(227,29,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(228,29,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(229,29,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(230,29,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(231,29,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(232,29,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(233,30,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(234,30,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(235,30,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(236,30,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(237,30,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(238,30,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(239,30,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(240,30,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(241,31,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(242,31,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(243,31,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(244,31,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(245,31,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(246,31,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(247,31,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(248,31,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(249,32,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(250,32,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(251,32,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(252,32,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(253,32,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(254,32,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(255,32,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(256,32,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(257,33,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(258,33,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(259,33,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(260,33,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(261,33,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(262,33,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(263,33,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(264,33,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(265,34,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(266,34,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(267,34,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(268,34,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(269,34,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(270,34,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(271,34,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(272,34,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(273,35,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(274,35,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(275,35,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(276,35,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(277,35,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(278,35,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(279,35,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(280,35,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(281,36,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(282,36,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(283,36,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(284,36,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(285,36,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(286,36,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(287,36,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(288,36,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(289,37,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(290,37,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(291,37,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(292,37,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(293,37,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(294,37,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(295,37,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(296,37,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(297,38,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(298,38,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(299,38,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(300,38,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(301,38,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(302,38,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(303,38,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(304,38,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(305,39,'heading','Section Heading','text','',NULL,'{"fontFamily": "Inter", "fontSize": 48, "fontWeight": 800, "lineHeight": 1.0, "letterSpacing": 0, "textAlign": "left", "color": "#102d46"}',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(306,39,'description','Description / Body Copy','textarea','',NULL,'{"fontFamily": "Inter", "fontSize": 14, "fontWeight": 400, "lineHeight": 1.8, "letterSpacing": 0, "textAlign": "left", "color": "#687c89"}',2,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(307,39,'eyebrow','Eyebrow / Label','text','',NULL,'{}',3,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(308,39,'cta_label','Button Text','text','',NULL,'{}',4,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(309,39,'cta_href','Button Link','url','',NULL,'{}',5,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(310,39,'image_src','Image Path','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',6,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(311,39,'image_alt','Image Alt Text','text','',NULL,'{}',7,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "content_fields" VALUES(312,39,'background_image','Background Image','image','',NULL,'{"fit": "cover", "position": "center center", "opacity": 100}',8,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
CREATE TABLE footer_settings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    setting_key TEXT NOT NULL UNIQUE,
    setting_value TEXT,
    setting_type TEXT NOT NULL DEFAULT 'text',
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "footer_settings" VALUES(1,'footer.description','Engineering, fabrication and industrial integration solutions built for demanding industries.','textarea','2026-10-29 06:50:08');
INSERT INTO "footer_settings" VALUES(2,'footer.copyright','© Sinsina Industrial Works. All rights reserved.','text','2026-10-29 06:50:08');
INSERT INTO "footer_settings" VALUES(3,'footer.contact.email','info@sinsinaworks.com','email','2026-10-29 06:50:08');
INSERT INTO "footer_settings" VALUES(4,'footer.contact.phone','','text','2026-10-29 06:50:08');
INSERT INTO "footer_settings" VALUES(5,'footer.social.linkedin','','url','2026-10-29 06:50:08');
INSERT INTO "footer_settings" VALUES(6,'footer.background','#081d2d','color','2026-10-29 06:50:08');
CREATE TABLE media (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    file_name TEXT NOT NULL,
    file_path TEXT NOT NULL UNIQUE,
    media_type TEXT NOT NULL DEFAULT 'image',
    title TEXT,
    alt_text TEXT,
    mime_type TEXT,
    width INTEGER,
    height INTEGER,
    file_size INTEGER,
    metadata_json TEXT NOT NULL DEFAULT '{}',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE navigation_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parent_id INTEGER,
    label TEXT NOT NULL,
    url TEXT NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_visible INTEGER NOT NULL DEFAULT 1,
    target TEXT NOT NULL DEFAULT '_self',
    metadata_json TEXT NOT NULL DEFAULT '{}',
    FOREIGN KEY(parent_id) REFERENCES navigation_items(id) ON DELETE CASCADE
);
INSERT INTO "navigation_items" VALUES(1,NULL,'Home','index.html',1,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(2,NULL,'About','about.html',2,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(3,NULL,'Products','products.html',3,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(4,NULL,'Services','services.html',4,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(5,NULL,'Experience','index.html#experience',5,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(6,NULL,'Career','career.html',6,1,'_self','{}');
INSERT INTO "navigation_items" VALUES(7,NULL,'Contact','mailto:info@sinsinaworks.com',7,1,'_self','{}');
CREATE TABLE pages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    file_name TEXT,
    is_active INTEGER NOT NULL DEFAULT 1,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "pages" VALUES(1,'home','Home','/','index.html',1,1,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(2,'about','About Us','/about','about.html',1,2,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(3,'brochure','Brochure','/brochure','brochure.html',1,3,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(4,'career','Career','/career','career.html',1,4,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(5,'certifications','Certifications','/certifications','certifications.html',1,5,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(6,'news','News','/news','news.html',1,6,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(7,'products','Products','/products','products.html',1,7,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(8,'services','Services','/services','services.html',1,8,'2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "pages" VALUES(9,'team','Team','/team','team.html',1,9,'2026-10-29 06:50:08','2026-10-29 06:50:08');
CREATE TABLE sections (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL,
    section_key TEXT NOT NULL,
    name TEXT NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_visible INTEGER NOT NULL DEFAULT 1,
    settings_json TEXT NOT NULL DEFAULT '{}',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(page_id, section_key),
    FOREIGN KEY(page_id) REFERENCES pages(id) ON DELETE CASCADE
);
INSERT INTO "sections" VALUES(1,1,'hero','Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(2,1,'why_clients_trust_sinsina','Why Clients Trust Sinsina',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(3,1,'about_us','About Us',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(4,1,'from_design_to_delivery','From Design to Delivery',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(5,1,'scale_facility','Scale / Facility',5,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(6,1,'our_capabilities','Our Capabilities',6,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(7,1,'proven_project_by_project','Proven Project by Project',7,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(8,1,'trusted_across_industries','Trusted Across Industries',8,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(9,1,'see_sinsina_at_work','See Sinsina at Work',9,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(10,1,'let_s_engineer_what_s_next','Let’s Engineer What’s Next',10,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(11,2,'about_hero','About Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(12,2,'company_overview','Company Overview',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(13,2,'vision_mission','Vision & Mission',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(14,2,'from_design_to_delivery','From Design to Delivery',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(15,3,'hero','Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(16,3,'brochure_company_profile','Brochure / Company Profile',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(17,3,'download_cta','Download / CTA',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(18,4,'career_hero','Career Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(19,4,'careers_content','Careers Content',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(20,4,'application_contact','Application / Contact',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(21,5,'certifications_hero','Certifications Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(22,5,'certificates','Certificates',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(23,5,'approvals_clients','Approvals / Clients',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(24,6,'news_intro','News Intro',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(25,6,'featured_news','Featured News',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(26,6,'news_feed','News Feed',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(27,6,'more_from_sinsina','More from Sinsina',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(28,7,'products_intro','Products Intro',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(29,7,'product_index','Product Index',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(30,7,'products_section','Products Section',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(31,7,'product_cards','Product Cards',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(32,8,'services_hero','Services Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(33,8,'execution_strip','Execution Strip',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(34,8,'industries','Industries',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(35,8,'difference_cta','Difference / CTA',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(36,9,'team_hero','Team Hero',1,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(37,9,'leadership_organization','Leadership & Organization',2,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(38,9,'top_leadership','Top Leadership',3,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "sections" VALUES(39,9,'management_groups','Management Groups',4,1,'{"backgroundColor": "#ffffff", "paddingTop": 0, "paddingBottom": 0, "minHeight": 0, "layout": "block"}','2026-10-29 06:50:08','2026-10-29 06:50:08');
CREATE TABLE seo_settings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id INTEGER NOT NULL UNIQUE,
    browser_title TEXT,
    meta_description TEXT,
    canonical_url TEXT,
    robots TEXT NOT NULL DEFAULT 'index, follow',
    og_title TEXT,
    og_description TEXT,
    og_image TEXT,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(page_id) REFERENCES pages(id) ON DELETE CASCADE
);
INSERT INTO "seo_settings" VALUES(1,2,'About Us | Sinsina Industrial Works','About Us | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(2,3,'Brochure | Sinsina Industrial Works','Brochure | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(3,4,'Career | Sinsina Industrial Works','Career | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(4,5,'Certifications | Sinsina Industrial Works','Certifications | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(5,1,'Sinsina Industrial Works','Home | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(6,6,'News | Sinsina Industrial Works','News | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(7,7,'Products | Sinsina Industrial Works','Products | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(8,8,'Services | Sinsina Industrial Works','Services | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
INSERT INTO "seo_settings" VALUES(9,9,'Team | Sinsina Industrial Works','Team | Sinsina Industrial Works',NULL,'index, follow',NULL,NULL,NULL,'2026-10-29 06:50:08');
CREATE TABLE theme_settings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    setting_key TEXT NOT NULL UNIQUE,
    setting_value TEXT,
    setting_type TEXT NOT NULL DEFAULT 'text',
    group_name TEXT NOT NULL DEFAULT 'general',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "theme_settings" VALUES(1,'theme.colors.navy','#071b2b','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(2,'theme.colors.navy2','#102d46','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(3,'theme.colors.blue','#087db8','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(4,'theme.colors.cyan','#35a8dd','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(5,'theme.colors.light','#eef3f6','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(6,'theme.colors.white','#ffffff','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(7,'theme.colors.text','#687c89','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(8,'theme.colors.line','#d9e3e8','color','colors','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(9,'theme.typography.bodyFont','Inter','font','typography','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(10,'theme.typography.headingFont','Inter','font','typography','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(11,'theme.typography.baseSize','14','number','typography','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(12,'theme.layout.containerWidth','1180','number','layout','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(13,'theme.shape.buttonRadius','0','number','shape','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(14,'theme.shape.cardRadius','0','number','shape','2026-10-29 06:50:08','2026-10-29 06:50:08');
INSERT INTO "theme_settings" VALUES(15,'theme.shape.borderWidth','1','number','shape','2026-10-29 06:50:08','2026-10-29 06:50:08');
CREATE INDEX idx_sections_page_id ON sections(page_id);
CREATE INDEX idx_fields_section_id ON content_fields(section_id);
CREATE INDEX idx_audit_entity ON audit_log(entity_type, entity_id);
CREATE VIEW vw_page_content AS
SELECT
    p.page_key,
    p.name AS page_name,
    p.slug,
    s.section_key,
    s.name AS section_name,
    s.sort_order AS section_order,
    s.is_visible,
    s.settings_json AS section_settings,
    f.field_key,
    f.label,
    f.field_type,
    f.value_text,
    f.value_json,
    f.settings_json AS field_settings,
    f.sort_order AS field_order
FROM pages p
JOIN sections s ON s.page_id = p.id
LEFT JOIN content_fields f ON f.section_id = s.id
ORDER BY p.sort_order, s.sort_order, f.sort_order;
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('pages',9);
INSERT INTO "sqlite_sequence" VALUES('sections',39);
INSERT INTO "sqlite_sequence" VALUES('content_fields',312);
INSERT INTO "sqlite_sequence" VALUES('theme_settings',15);
INSERT INTO "sqlite_sequence" VALUES('navigation_items',7);
INSERT INTO "sqlite_sequence" VALUES('footer_settings',6);
INSERT INTO "sqlite_sequence" VALUES('seo_settings',9);
COMMIT;
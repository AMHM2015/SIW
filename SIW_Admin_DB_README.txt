SIW ADMIN CMS DATABASE
======================

FILES
-----
1) siw_admin_cms.db
   Ready-to-use SQLite database.

2) siw_admin_cms_schema.sql
   Full SQL dump including schema + seed data.
   Can be used as a reference when migrating to SQL Server/MySQL/PostgreSQL.

IMPORTANT
---------
- No username/password table is included because company login will be external.
- The audit_log table includes external_user_id and external_user_email so the
  company authentication system can pass the authenticated user identity later.

MAIN TABLES
-----------
pages
sections
content_fields
media
theme_settings
navigation_items
footer_settings
seo_settings
audit_log

KEY DESIGN
----------
The CMS frontend uses data keys such as:
  home.hero.heading
  services.services_hero.image.src
  theme.colors.blue

Recommended backend mapping:
- Page -> pages.page_key
- Section -> sections.section_key
- Field -> content_fields.field_key
- Field style/design -> content_fields.settings_json
- Section layout/design -> sections.settings_json

The database is intentionally flexible so new editable fields can be added
without changing the database structure.

LOGIN
-----
External company authentication can be added later.
After successful login, the backend should identify the user and authorize
API requests. The CMS database itself should never store company passwords.

API EXAMPLES
------------
GET  /api/pages/home
GET  /api/pages/services
PUT  /api/content/home/hero/heading
PUT  /api/theme/theme.colors.blue
POST /api/media
GET  /api/navigation
PUT  /api/footer

PUBLIC WEBSITE
--------------
Best architecture:
Admin Dashboard -> API -> Database
Public Website  -> API -> Database

This keeps the admin and website synchronized from one source of truth.

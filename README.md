# Pro Boys Auto Parts – setup (about 15 minutes)

## 1. Supabase (database + logins)
1. Create a free project at supabase.com.
2. SQL Editor > New query > paste `setup.sql` > Run.
3. Authentication > Users > Add user > Create new user. Add both admins
   (moagil75@gmail.com and kabomoagi14@gmail.com), choose a password for each,
   and tick "Auto Confirm User".
4. Authentication > Sign In / Providers: turn OFF "Allow new users to sign up".
5. Project Settings > API: copy the Project URL and the anon public key.

## 2. Connect the site
Open `index.html`, find the first lines of the last `<script>`, and replace
`PASTE_YOUR_SUPABASE_URL` and `PASTE_YOUR_ANON_KEY`. (The anon key is meant to be public;
the database rules in setup.sql are what protect your products.)

## 3. Go live
- Netlify: app.netlify.com/drop, drag in this whole folder.
- Or put the folder on GitHub and connect it to Netlify/Vercel/Cloudflare Pages.

## Using it
Tap the small lock button (bottom-right), sign in, then use the menu:
Add product, Manage products (edit, mark sold, delete), Sign out.

Security: only the two admin emails can add, edit or delete, enforced by the database, not just the page.
To change admins, edit the emails in `setup.sql` (function is_admin) and the ADMINS list in index.html.

# Pro Boys Auto Parts – Firebase setup (about 15 minutes)

## 1. Create the Firebase project (free Spark plan is enough)
1. console.firebase.google.com > Add project.
2. Build > Authentication > Get started > Sign-in method > enable **Email/Password**.
3. Authentication > Users > Add user. Create both admins right away
   (moagil75@gmail.com and kabomoagi14@gmail.com) with passwords you choose.
4. Build > Firestore Database > Create database (production mode).
5. Firestore > Rules tab > paste the contents of `firestore.rules` > Publish.
6. Project settings > General > Your apps > Web (</>) > register an app and copy the config.

## 2. Connect the site
Open `index.html`, find `firebaseConfig` near the top of the last script, and paste in
apiKey, authDomain, projectId and appId. (These values are meant to be public;
the Firestore rules are what protect your products.)

## 3. Go live
- Netlify: app.netlify.com/drop, drag in this whole folder.
- Then add your live domain: Authentication > Settings > Authorized domains.

## Using it
Tap the small lock button (bottom-right), sign in, then use the menu:
Add product, Manage products (edit, mark sold, delete), Sign out.

Notes
- Photos are shrunk and stored inside each product record, so you do NOT need
  Firebase Storage (which now requires a paid plan). Keep to one photo per product.
- Only the two admin emails can change products, enforced by the Firestore rules.
- To change admins, edit the emails in `firestore.rules` and the ADMINS list in index.html.

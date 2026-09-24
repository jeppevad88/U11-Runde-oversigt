# U11 Holdfordeler – GitHub Pages + Supabase

## 1. Supabase
1. Create/open the Supabase project.
2. Authentication → Providers → Anonymous Sign-Ins: enable it.
3. SQL Editor → New query → paste all of `supabase.sql` → Run.

## 2. GitHub
1. Create a repository, e.g. `u11-holdfordeler`.
2. Upload all files in this folder to the repository root.
3. Settings → Pages → Build and deployment → Source: Deploy from a branch.
4. Branch: `main`, folder: `/ (root)` → Save.
5. Wait a few minutes and open the generated Pages URL.

The site uses the Supabase publishable key in `supabase-config.js`. This key is intended for public browser code, but database access must be protected by Row Level Security (RLS). Never put a Supabase secret/service-role key in this repository.

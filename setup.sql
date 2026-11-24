-- Run this once in Supabase: SQL Editor > New query > paste > Run
create table public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  price numeric default 0,
  brand text,
  condition text default 'New',
  stock int default 1,
  description text,
  image_url text,
  sold boolean default false,
  created_at timestamptz default now()
);
alter table public.products enable row level security;

create or replace function public.is_admin() returns boolean
language sql stable as $$
  select coalesce(lower(auth.jwt() ->> 'email') in ('moagil75@gmail.com','kabomoagi14@gmail.com'), false)
$$;

create policy "anyone can view" on public.products for select using (true);
create policy "admins insert" on public.products for insert with check (public.is_admin());
create policy "admins update" on public.products for update using (public.is_admin()) with check (public.is_admin());
create policy "admins delete" on public.products for delete using (public.is_admin());

insert into storage.buckets (id, name, public) values ('product-images','product-images', true) on conflict do nothing;
create policy "anyone can view images" on storage.objects for select using (bucket_id = 'product-images');
create policy "admins upload images" on storage.objects for insert with check (bucket_id = 'product-images' and public.is_admin());
create policy "admins update images" on storage.objects for update using (bucket_id = 'product-images' and public.is_admin());
create policy "admins delete images" on storage.objects for delete using (bucket_id = 'product-images' and public.is_admin());

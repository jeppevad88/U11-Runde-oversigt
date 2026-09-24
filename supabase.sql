-- U11 Holdfordeler: fælles database til GitHub Pages
-- Kør hele dette script i Supabase Dashboard → SQL Editor.

create table if not exists public.u11_state (
  id text primary key,
  state jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.u11_state enable row level security;

grant select, insert, update on public.u11_state to authenticated;

drop policy if exists "U11 authenticated read" on public.u11_state;
drop policy if exists "U11 authenticated insert" on public.u11_state;
drop policy if exists "U11 authenticated update" on public.u11_state;

create policy "U11 authenticated read"
on public.u11_state for select
to authenticated
using (true);

create policy "U11 authenticated insert"
on public.u11_state for insert
to authenticated
with check (true);

create policy "U11 authenticated update"
on public.u11_state for update
to authenticated
using (true)
with check (true);

-- Opret den første tomme række, hvis den ikke findes.
insert into public.u11_state (id, state)
values ('main', '{"rounds":{},"updatedAt":null}'::jsonb)
on conflict (id) do nothing;

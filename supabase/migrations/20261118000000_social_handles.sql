-- =====================================================================
-- Updated social handles (Instagram + YouTube)
-- Idempotent — safe to run on an existing database.
--
-- The site reads these from `settings` and only falls back to the
-- hardcoded values in src/lib/site.ts when a row is absent, so an
-- already-seeded database needs these rows refreshed.
-- =====================================================================

insert into settings (key, value, group_name)
values ('social.instagram', to_jsonb('https://www.instagram.com/gorealtorspro.in/'::text), 'social')
on conflict (key) do update set value = excluded.value, group_name = excluded.group_name;

insert into settings (key, value, group_name)
values ('social.youtube', to_jsonb('https://www.youtube.com/@Gorealtorspro'::text), 'social')
on conflict (key) do update set value = excluded.value, group_name = excluded.group_name;

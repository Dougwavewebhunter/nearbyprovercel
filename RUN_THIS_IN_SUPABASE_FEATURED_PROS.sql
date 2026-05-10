-- RUN THIS ONCE in Supabase SQL Editor before/after deploying the new GitHub files.
-- It adds the admin Featured switch for providers.

ALTER TABLE public.providers
ADD COLUMN IF NOT EXISTS is_featured boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_providers_featured_created
ON public.providers (is_featured DESC, created_at DESC);

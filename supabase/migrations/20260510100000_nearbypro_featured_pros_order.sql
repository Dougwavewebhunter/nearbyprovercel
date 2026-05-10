-- Featured Pros upgrade
-- Adds admin-controlled pinning while keeping newest providers visible first.

ALTER TABLE public.providers
ADD COLUMN IF NOT EXISTS is_featured boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_providers_featured_created
ON public.providers (is_featured DESC, created_at DESC);

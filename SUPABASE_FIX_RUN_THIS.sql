-- NearbyPro latest Supabase fix
-- Run this in Supabase SQL Editor if you have not already added the Featured Pros column.
-- This is safe to run more than once.

ALTER TABLE public.providers
ADD COLUMN IF NOT EXISTS is_featured boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_providers_featured_created
ON public.providers (is_featured DESC, created_at DESC);

up:
	@cp .env.example .env || true
	@php artisan key:generate
	@composer install
	@pnpm install
	@php artisan migrate
	@php artisan db:seed
	@pnpm run dev
	@php artisan serve
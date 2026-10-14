# Bangladesh Smart Travel — Node.js / Express edition

This project is a port of the supplied Laravel application into **Node.js, Express, EJS, HTML, CSS and browser JavaScript**. It includes a redesigned responsive interface and preserves the main user journeys found in the source routes: public destinations/attractions/packages, authentication and role-aware dashboards, a budget trip estimator, saved trip plans, booking requests and responses, agent profile editing, and admin CRUD for travel directory records.

## Requirements

- Node.js 18 or newer
- npm

## Run locally

1. Extract this ZIP.
2. Copy `.env.example` to `.env` and change `SESSION_SECRET` to a long random value.
3. Open a terminal in this project folder and run:

   ```bash
   npm install
   npm run seed
   npm start
   ```

4. Visit <http://localhost:3000>.

The application creates `database/database.sqlite` automatically. `npm run seed` inserts optional demo destinations, attractions, hotels and food estimates; run it once for a populated first launch. It uses `INSERT OR IGNORE`, so rerunning it does not duplicate the supplied starter IDs.

## Database compatibility

The Laravel source config uses SQLite by default. This project also defaults to SQLite and uses the same main table names and compatible core column names (`users`, `destinations`, `tourist_attractions`, `agent_profiles`, `hotels`, `hotel_room_types`, `transport_options`, `food_costs`, `additional_expenses`, `tour_packages`, `travel_plans`, `travel_plan_items`, `bookings`, `booking_status_histories`, and `reviews`). Set `DB_PATH` to point at a copy of an existing Laravel SQLite database if you want to reuse existing records. **Back up the database first.** Laravel and this app should not write to the same SQLite file concurrently during migration/testing. Tables/columns that already exist are not destructively replaced; the app's schema initializer only creates missing tables and indexes.

The supplied Laravel archive did not include a populated SQLite database, so the ZIP cannot carry over actual user records. A fresh local database is created when first launched. Existing MySQL databases are not automatically connected by this SQLite build; exporting/importing data or adapting the connection layer is required if your deployed Laravel app uses MySQL.

## Roles and accounts

Register as a traveller or tour agent. The public registration form intentionally does **not** allow creating an admin account. To promote an account for local development, use SQLite tooling and set its `role` to `admin` in the `users` table. Agent accounts receive an `agent_profiles` record with pending approval by default.

## Features included

- Responsive landing page, destination directory and destination details
- Attraction detail and tour package browsing
- Registration, sign-in, sign-out, hashed passwords and session authentication
- Role-protected dashboards and booking visibility
- Trip estimate with accommodation, food, activity and transport line items
- Save, list, view and delete trip plans
- Booking requests, reference codes, booking details, agent status responses and status history
- Agent profile management
- Admin create/list/edit/delete for destinations, attractions, hotels, tour packages, transport options, food costs and additional expenses
- SQLite-backed sessions, prepared SQL statements, basic security headers and form confirmation prompts

## Notes about parity

The original project includes Laravel services for more detailed cost calculations, agent availability, recommendation logic and policy/middleware rules. This first Express port recreates the primary screens and operational flows, but the planner's estimate is a transparent starter estimate rather than a line-for-line port of Laravel's `TravelCostCalculator`/`PlannerService`; agent availability matching, reviews and some detailed package-item/room-type workflows are not yet implemented. Review and test against your production Laravel behaviour before replacing it. Never expose a development admin account or use the fallback session secret in production.

## Project layout

- `server.js` — Express server and middleware
- `src/db.js` — SQLite schema setup
- `src/routes.js` — route handlers, authorization and persistence
- `views/` — EJS templates
- `public/css/style.css` — responsive visual redesign
- `public/js/app.js` — frontend interactions
- `database/seed.sql` — optional demo content

## Troubleshooting

- If native SQLite dependency installation fails, use a supported current Node.js LTS build and rerun `npm install`.
- If port 3000 is occupied, set `PORT=3001` in `.env`.
- If adapting an existing database, work on a copy and compare your actual SQLite schema with `src/db.js` first.

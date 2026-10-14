# Porting notes from the supplied Laravel source

## Inspected before conversion

- `routes/web.php` for the public, tourist, agent and admin route map
- Database migrations for users, destinations, attractions, agents/availability, transport, hotels/room types, food/expenses, packages, travel plans and bookings/history/reviews
- `PlannerService`, `TravelCostCalculator`, `TripRecommendationService` and `AgentAvailabilityService` for original business rules
- `BookingController` and `TripController` for ownership, role and availability checks
- The Blade view tree to identify the screens to replace with EJS

## Ported flows

- Public destination, attraction and package pages
- Register/login/logout with bcrypt password hashes and session authentication
- Role-aware dashboard and route guards
- Planner cost estimate using available hotel-room, food, attraction and transport rates
- Save/list/show/delete trip plans
- Booking requests, booking details, status history and agent responses
- Agent profile editing
- Admin CRUD for destinations, attractions, hotels, packages, transport options, food costs and additional expenses
- Responsive EJS frontend redesign and client-side destination filtering/date validation/confirmation prompts

## Compatibility and known gaps

The source archive uses SQLite by default in `.env.example`, so SQLite is the default here too. Table names and the core Laravel-migration columns are retained. `src/db.js` uses `CREATE TABLE IF NOT EXISTS`; this avoids destructive replacement but cannot retrofit missing columns into a nonmatching database. Compare the schema and use a backup before pointing `DB_PATH` at an existing application database.

The Laravel `TravelCostCalculator` has detailed transport direction/fare rules, accommodation category/room occupancy calculations, food preferences, attraction aggregation, and additional expense units. The Express planner currently provides a simpler starter estimate and should be checked against expected production totals. `TripRecommendationService` multi-option recommendation/sorting is not fully recreated; current planner calculates a single destination estimate. Booking assignment uses approved agents linked to the destination and checks basic availability/date conflicts, but the full Laravel validation/transaction behavior, full agent-destination management UI, complete booking status transition restrictions, review workflow, package item editing, room type management, pagination, and every Laravel validation message are not fully reproduced yet.

The ZIP does not contain a populated Laravel SQLite file, so existing user or travel records cannot be bundled. Use `npm run seed` to add optional demo destination content to a new database. To create a local admin securely, set `ADMIN_EMAIL`, `ADMIN_PASSWORD` (12+ characters), and optionally `ADMIN_NAME`, then run `npm run create-admin`. Do not use a weak password or expose this development instance publicly.

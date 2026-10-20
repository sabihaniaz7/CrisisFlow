# CrisisFlow

AI-powered emergency reporting, responder coordination, and command-center workflow for crisis response teams.

CrisisFlow is a Flutter mobile app backed by a FastAPI service. Citizens can report emergencies with location, media, and details; AI helps classify severity and recommended resources; admins assign responders from a live incident queue; responders receive assignments and status updates in real time.

[![Download APK](https://img.shields.io/badge/Download-APK-16A34A?style=for-the-badge&logo=android&logoColor=white)](https://drive.google.com/file/d/1u_XGBt_fbBD8UTJaitJZ0kfwFLyBLDe0/view?usp=sharing)
[![Documentation](https://img.shields.io/badge/View-Documentation-2563EB?style=for-the-badge&logo=googledocs&logoColor=white)](https://drive.google.com/file/d/1G5VxDWpZMqXeB4FUpQsfdnlgIwFWdlAN/view?usp=sharing)
![Flutter](https://img.shields.io/badge/Flutter-3.47.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-0.115-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-ready-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![WebSockets](https://img.shields.io/badge/Realtime-WebSockets-111827?style=for-the-badge)

## Features

- Citizen emergency reporting with incident type, GPS location, reverse-geocoded address, description, and media upload.
- AI-assisted incident analysis using Gemini, with an offline heuristic fallback so demos keep working without an API key.
- Severity and priority scoring based on configurable incident signals.
- Duplicate incident detection using distance and time-window checks.
- Real-time incident updates over WebSockets for citizens, admins, and responders.
- Admin command center with dashboard, incident queue, responder management, analytics, assignments, audit logs, settings, and user controls.
- Super Admin user management for promoting citizens to admin roles.
- Responder workflow for receiving assignments and updating incident progress.
- Incident lifecycle tracking from reported to assigned, on the way, arrived, and resolved.
- Local and background notification support.
- SOS flow for urgent emergency actions.
- Chat support attached to incidents.
- Postgres-backed persistence with SQLite fallback for quick local startup.
- Mobile-first Flutter UI with responsive phone sizing.

## Tech Stack

| Layer | Technology |
| --- | --- |
| Mobile | Flutter, Dart, Material UI |
| Backend | FastAPI, Pydantic, SQLAlchemy |
| Database | PostgreSQL, SQLite fallback |
| Realtime | WebSockets |
| AI | Google Gemini with local fallback |
| Device APIs | GPS, geocoding, camera/media picker, local notifications |

## Project Structure

```text
.
|-- lib/
|   |-- main.dart
|   `-- mobile/
|       |-- config/          # API and websocket configuration
|       |-- core/            # Theme, reusable widgets, utilities
|       |-- models/          # App models
|       |-- screens/         # Citizen, responder, admin, auth, profile flows
|       `-- services/        # API, sockets, AI, notifications, SOS
|-- backend/
|   |-- app/
|   |   |-- main.py          # FastAPI app entry point
|   |   |-- database.py      # Database setup
|   |   |-- models/          # SQLAlchemy and Pydantic models
|   |   |-- routers/         # API routes
|   |   `-- services/        # AI, scoring, duplicates, settings, realtime
|   `-- requirements.txt
|-- android/
|-- ios/
|-- web/
`-- pubspec.yaml
```

## Getting Started

### Prerequisites

- Flutter SDK with Dart `^3.13.0`
- Python `3.10+`
- PostgreSQL for persistent local data, or SQLite for a fast demo fallback
- Optional Gemini API key from Google AI Studio

### Backend Setup

```bash
cd backend
python -m venv venv

# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate

pip install -r requirements.txt
```

Create `backend/.env`:

```env
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost:5432/crisisflow
GEMINI_API_KEY=your_optional_gemini_key
```

If `DATABASE_URL` is not set, the backend uses the local SQLite fallback.

Start the API:

```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Seed demo users and responders in a second terminal:

```bash
cd backend
python -m app.seed
```

API health check:

```text
http://localhost:8000
```

Interactive API docs:

```text
http://localhost:8000/docs
```

### Mobile Setup

```bash
flutter pub get
flutter run
```

The mobile app reads backend settings from:

```text
lib/mobile/config/app_config.dart
```

For local development, point the app at your backend:

| Target | Host value |
| --- | --- |
| Android emulator | `10.0.2.2` |
| iOS simulator | `localhost` |
| Real device | Your computer LAN IP, for example `192.168.x.xx` |
| Deployed backend | Your server domain |

## Demo Accounts

All seeded users use the same password:

```text
demo1234
```

| Role | Email |
| --- | --- |
| Citizen | `citizen@crisisflow.demo` |
| Responder | `responder@crisisflow.demo` |
| Admin | `admin@crisisflow.demo` |
| Super Admin | `superadmin@crisisflow.demo` |

## Core Workflows

1. A citizen reports an emergency with type, location, details, and optional media.
2. The backend analyzes severity, recommended resources, duplicate risk, and priority.
3. The incident appears instantly in the admin command center.
4. An admin assigns the best available responder.
5. The responder receives the assignment and updates status.
6. Citizens, admins, and responders see lifecycle changes in real time.

## API Overview

| Area | Routes |
| --- | --- |
| Auth | `/api/auth/*` |
| Incidents | `/api/incidents/*` |
| Responders | `/api/responders/*` |
| Dashboard | `/api/dashboard/*` |
| AI analysis | `/api/ai/*` |
| Users | `/api/users/*` |
| Settings | `/api/settings/*` |
| Audit logs | `/api/audit-logs/*` |
| Assignments | `/api/assignments/*` |
| SOS | `/api/sos/*` |
| Realtime | `/ws` |

## Environment Notes

- Gemini is optional. Without a key, CrisisFlow uses an offline keyword-based severity fallback.
- Android cleartext HTTP may require `android:usesCleartextTraffic="true"` while testing against a local non-HTTPS backend.
- Media uploads are served from the backend `/media` path.
- Data persists in PostgreSQL when `DATABASE_URL` is configured.
- SQLite fallback is useful for quick demos but is not intended for production.

<!-- ## Screenshots

Add screenshots or GIFs here when publishing the repository:

```text
docs/screenshots/
|-- citizen-report.png
|-- admin-dashboard.png
|-- responder-assignment.png
`-- incident-tracking.png
``` -->

---

#### Developed By Sabiha Niaz

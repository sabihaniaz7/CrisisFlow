# CrisisFlow

**AI-powered emergency reporting, responder coordination, and command-center workflow for crisis response teams.**

CrisisFlow is a Flutter mobile app backed by a FastAPI service. Citizens report emergencies with location, media, and details. AI classifies severity and recommends resources. Admins assign responders from a live incident queue, and responders receive assignments and push status updates in real time.

[![Run Live](https://img.shields.io/badge/Run_Live-Mobile_Web-F59E0B?style=for-the-badge&logo=googlechrome&logoColor=white)](https://crisis-flow-web.vercel.app/)
[![Download APK](https://img.shields.io/badge/Download-APK-16A34A?style=for-the-badge&logo=android&logoColor=white)](https://drive.google.com/file/d/1u_XGBt_fbBD8UTJaitJZ0kfwFLyBLDe0/view?usp=sharing)
[![Documentation](https://img.shields.io/badge/View-Documentation-2563EB?style=for-the-badge&logo=googledocs&logoColor=white)](https://drive.google.com/file/d/1G5VxDWpZMqXeB4FUpQsfdnlgIwFWdlAN/view?usp=sharing)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![WebSockets](https://img.shields.io/badge/Realtime-WebSockets-111827?style=for-the-badge)
![Gemini](https://img.shields.io/badge/AI-Google_Gemini-8E75B2?style=for-the-badge&logo=googlegemini&logoColor=white)

---

## Try It

| Option | How |
| --- | --- |
| **Live demo** | Open the **Run Live** badge above in a mobile browser (or desktop browser with phone-size window). |
| **Android** | Download the APK using the badge above and install it on your device. |
| **Docs** | Read the full project documentation using the **View Documentation** badge. |

### Demo Accounts

Password for all accounts: `demo1234`

| Role | Email |
| --- | --- |
| Citizen | `citizen@crisisflow.demo` |
| Responder | `responder@crisisflow.demo` |
| Admin | `admin@crisisflow.demo` |
| Super Admin | `superadmin@crisisflow.demo` |

> Tip: log in as a **Citizen** on one device and as an **Admin** on another to watch incidents appear and update in real time.

---

## Features

**Citizens**
- Report emergencies with incident type, GPS location, reverse-geocoded address, description, and photo/media upload
- One-tap **SOS** flow for urgent situations
- Live incident tracking with real-time status updates
- In-incident chat support

**AI & Prioritization**
- Incident analysis powered by Google Gemini, with an offline keyword-based fallback so the app keeps working without an API key
- Severity and priority scoring from configurable incident signals
- Recommended resources for each incident
- Duplicate incident detection using distance and time-window checks

**Admin Command Center**
- Dashboard and live incident queue
- Responder management and assignments
- Analytics, audit logs, and system settings
- Super Admin user management (promote citizens to admin roles)

**Responders**
- Receive assignments instantly
- Update progress through the full lifecycle: *Reported → Assigned → On the way → Arrived → Resolved*

**Platform**
- Real-time updates over WebSockets for all roles
- Local and background notifications
- PostgreSQL persistence
- Mobile-first, responsive Flutter UI

---

## How It Works

1. A citizen reports an emergency with type, location, details, and optional media.
2. The backend analyzes severity, recommended resources, duplicate risk, and priority.
3. The incident appears instantly in the admin command center.
4. An admin assigns the best available responder.
5. The responder receives the assignment and updates status.
6. Citizens, admins, and responders see every change in real time.

---

## Tech Stack

| Layer | Technology |
| --- | --- |
| Mobile | Flutter, Dart, Material UI |
| Backend | FastAPI, Pydantic, SQLAlchemy |
| Database | PostgreSQL |
| Realtime | WebSockets |
| AI | Google Gemini with local fallback |
| Device APIs | GPS, geocoding, camera/media picker, local notifications |

---

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

<!-- --- -->

<!-- ## Screenshots

<!-- Add images to a /screenshots folder, then uncomment:

| Citizen Report | Admin Dashboard | Responder Assignment | Incident Tracking |
| --- | --- | --- | --- |
| ![Report](screenshots/citizen-report.png) | ![Dashboard](screenshots/admin-dashboard.png) | ![Assignment](screenshots/responder-assignment.png) | ![Tracking](screenshots/incident-tracking.png) |

--> 

---

### Author

**Sabiha Niaz** — Flutter Developer
<!-- GitHub: [@sabihaniaz7](https://github.com/sabihaniaz7) -->

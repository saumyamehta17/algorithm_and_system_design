## TicketSystem Like Fandango or BookMyShow

### FR:
- System will show available cinemas for a service
- System will shows all movies based on city selected by user
- User can search movie, can see slots and available seats
- User can book multiple seats
- User can hold seats for few minutes before payment, and user should be able to wait for seats may become available hold by others.
- Admin can add movies, price, seats, timings
- System will notify user about the upcoming bookings
- System would recommend user about new movies/shows

### NFR:
Available, Reliable, Handle Concurrent booking requests

### Estimation: 
1 Million active users
One user = 1 booking in a week
Total bookings = 1 Million in a week
1 day = 144000, 1 second = 144000/86400 ~= 1.5 request

Storage: 
- 10 Million page views
- cities = 500, 
- cinemas = 10 in each city
- seats in cinema = 2000
- shows per day = 2
- booking would need around 50 bytes(seat_numbers, cinema_id, city_id, show_id, status)
- Total data 500*10*2000*2*50bytes = 100MB per day
- 5 years = 5*365*100MB = 172500MB =~ 172GB   

### Api Design:
api/v1/shows?location&language
api/v1/book?show_id&seats

### Schema: (MySql)
Movie - id, name, genre, plot, duration, release date, actors
Show - id, movie_id, city, hall_id,  cinema_id
Cinema - id, location, name
Hall - cinema_id, number, direction, seats
Seat - id, number, type, zone
Booking - id, user_id, show_id, booked_seats, price, time
User - id, booking_id, name, email, dob

### High Level Design:

### Low Level Design:
- User will come and search shows by cities, genre
- System will displays all movies with their details and show times

- Search Service which will get data from DB and rank them and send to user. by price, by rating
- Booking Service, which will take data like movie, show, place, seats and try book in lock based env.
- Payment Service
- Notification service will send status about booking
- Cache most hot cities
- Waiting Service and ActiveBookingService

### Concurrency handling
can be handled by isolation level Serializable which can hold lock on range of rows, like follow:

```sql
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;

 select * from show_seats where show_id=99 AND seat_id in (10,11,12,13) AND status=free
 update show_seats;
 update booking;

COMMIT TRANSACTION;
```

### Fault Tolerance
### Partition

 
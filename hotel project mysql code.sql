create database hotelproject;
use hotelproject;
create table hotelbooking( customer_id int,
						   property_id int,
                           city varchar(100),
                           booking_date int,
                           check_in_date datetime,
                           check_out_date datetime,
						   room_type varchar(100),
                           num_rooms_booked int,
                           stay_type varchar(100),
                           booking_channel varchar(100),
                           booking_value float,
                           costprice int,
                           markup int,
                           selling_price int,
                           payment_method varchar(100),
                           refund_status varchar(100),
                           refund_amount float,
                           channel_of_booking varchar(100),
                           booking_status varchar(100),
                           travel_date varchar(100),
                           cashback float,
                           coupon_redeem float ,
                           Coupon_USed varchar(100),
                           stay_length int,
                           month int,
                           year int,
                           profit int 
                           );
ALTER TABLE hotelbooking ADD COLUMN star_rating INT;   

select * from hotelbooking;


-- 1) TOTAL BOOKINGS 
SELECT COUNT(*)
FROM HOTELBOOKING;

-- 2) CANCELLARATION RATE
select booking_status, count(*)
from hotelbooking
group by booking_status;

-- 3) CHANNEL PERFORMANCE 
select booking_channel, count(*) as total, sum(booking_value) revenue
from hotelbooking
group by booking_channel;

-- 4) ROOM TYPE PERFORMANCE 
select room_type, avg(booking_value)
from hotelbooking
group by room_type;

-- 5) HIGHEST PROFIT SALARY
select city, sum(profit) as profit
from hotelbooking
group by city
order by profit desc;

-- 6) MONTHLY TREND 
select month(booking_date), sum(booking_value)
from hotelbooking
group by month(booking_date);

-- 7) CANCELLERATION BY ROOM TYPE
select room_type, count(*)
from hotelbooking
where booking_status = 'cancelled'
group by room_type;
                           

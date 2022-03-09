show databases;
create database railways;
use railways;

/* Table 1 */
create table if not exists customer_details ( AadharNo bigint(12) primary key,
                                              Name varchar(50) not null,
                                              Gender ENUM('Male', 'Female', 'Prefer not to say') not null,
                                              DOB Date not null,
                                              email varchar(60)
                                              );
                                              
insert into customer_details values (910266788968 , 'Ekansh Vashistha', 1, '1998-11-15', '025015@fsm.ac.in');
insert into customer_details values (123456789099, 'Aashika Jain', 2, '2000-02-27', '025001@fsm.ac.in');
insert into customer_details values (678680017897, 'Rishika', 2, '2000-02-24', '301039@fdm.ac.in');
insert into customer_details values (653562694977, 'Atul', 1, '1996-03-04', 'atuldubey169@gmail.com'),
(785438245682, 'Samyak Jain', 1, '2000-07-07', 'sjain1360@gmail.com'),
(453556654321, 'Shubham Gupta', 1, '1997-03-24', '025032@fsm.ac.in'),
(914400748184, 'Ashish', 1, '1999-06-30', 'ashishbajaj759@gmail.com'),
(896960658332, 'Yatin Chopra', 1, '1999-07-25', '025039@fsm.ac.in'),
(123556123456, 'Shiwani', 2, '1996-08-25', 'Shiwani.1234@gmail.com'),
(662690711413, 'Bagyashree C.M', 2, '1996-05-26', 'bagyashree33@gmail.com'),
(256645664322, 'Natasha Shrivastava', 2, '1996-12-25', '025023@fsm.ac.in'),
(248669347944, 'Anamika Dwivedi', 2, '1996-11-04', 'anamika.dwivedi04@gmail.com'),
(123400786347, 'Lakshyadeep Singh Chouhan ', 1, '2000-07-25', '025018@fsm.ac.in'),
(969068157088, 'Chhavi Gola', 2, '2000-01-02', 'Chhavigola85gmailcom'),
(655201359171, 'Ankur kasana', 1, '1998-08-14', 'ankur.kasana2305@gmail.com'),
(899117566666, 'Akanksha singh', 2, '1993-12-21', 'Akanksha.singh7416@gmail.com'),
(259004001596, 'Charu Gagneja', 2, '2001-10-02', 'charushi1111@gmail.com');


/* Table 2 */
create table if not exists booking_details (b_id varchar(4) primary key,
                                            DOJ Date not null,
                                            BoardingStation varchar(50) not null,
                                            Destination varchar(50) not null,
                                            CoachPref ENUM('AC1', 'AC2', 'AC3', 'Sleeper') not null,
                                            BerthPref ENUM('Side Lower', 'Side Upper', 'Middle', 'Cabin Lower', 'Cabin Upper') not null,
                                            Dest_add varchar(100) not null,
                                            Payment ENUM('UPI/Paytm', 'Net Banking', 'DebitCard/Credit Card') not null
                                            );
                                            
insert into booking_details values ('B101', '2022-03-30', 'New Delhi ', 'Saharanpur ', 1, 5, 'Madho Nagar , Saharanpur ', 1),
('B102', '2022-03-06', 'New Delhi', 'Chandigarh', 1, 1, 'House no. 131, Sector-10', 2),
('B103', '2022-04-22', 'New Delhi', 'Bathinda', 3, 1, 'Bathinda', 1),
('B104', '2022-02-18', 'Varanasi', 'New Delhi', 2, 2, 'Alpha 1, Greater noida', 1),
('B105', '2022-03-11', 'New Delhi', 'Jammu', 1, 5, 'Jammu Tawi', 3),
('B106', '2022-03-16', 'New Delhi', 'Sirhind', 2, 1, 'Shastri Nagar, Mandi Gobindgarh, Punjab', 2),
('B107', '2022-03-12','New Delhi', 'Amritsar', 3, 5, 'Amritsar', 1),
('B108', '2022-03-09', 'New Delhi ', 'Rewa', 1, 5, 'Rewa District', 1),
('B109', '2022-03-07', 'Rewa', 'New Delhi', 1, 1, 'Lajpat nagar', 1),
('B110', '2022-03-06', 'New Delhi ', 'Chennai', 1, 1, 'Chennai', 1),
('B111', '2022-02-11', 'New Delhi ', 'Kanpur', 2, 5, 'Kidwai Nagar, Kanpur', 3),
('B112', '2022-04-13', 'New Delhi ', 'Prayagraj', 3, 1, 'Prayagraj', 1),
('B113', '2022-03-11', 'New Delhi ', 'Jodhpur JDP', 2, 2, 'City palace', 1),
('B114', '2022-11-29', 'New Delhi ', 'Palampur', 2, 4, 'Palampur, Himachal Pradesh', 3),
('B115', '2022-03-06', 'New Delhi ', 'Ujjain', 2, 1, 'Ujjain ', 1),
('B116', '2022-05-25', 'New Delhi ', 'Mumbai', 1, 1, 'Mumbai bandra', 1),
('B117', '2022-03-16', 'New Delhi ', 'Rudrapur', 1, 2, 'Gadarpur, Uttarakhand ', 1);


/* Table 3 */
create table if not exists rel_customer_booking_details (b_id varchar(4) not null,
                                            DOJ Date not null,
                                            BoardingStation varchar(50) not null,
                                            Destination varchar(50) not null,
                                            CoachPref ENUM('AC1', 'AC2', 'AC3', 'Sleeper') not null,
                                            BerthPref ENUM('Side Lower', 'Side Upper', 'Middle', 'Cabin Lower', 'Cabin Upper') not null,
                                            Dest_add varchar(100) not null,
                                            Payment ENUM('UPI/Paytm', 'Net Banking', 'DebitCard/Credit Card') not null,
                                            AadharNo bigint(12) not null,
                                            PhnNo bigint(10) not null,
                                            primary key (b_id, AadharNo),
                                            foreign key (b_id) references booking_details(b_id),
                                            foreign key (AadharNo) references customer_details(AadharNo)
                                            );
                                           
insert into rel_customer_booking_details values ('B101', '2022-03-30', 'New Delhi ', 'Saharanpur ', 1, 5, 'Madho Nagar , Saharanpur ', 1, 910266788968, 9571043839);
insert into rel_customer_booking_details values ('B102', '2022-03-06', 'New Delhi', 'Chandigarh', 1, 1, 'House no. 131, Sector-10', 2, 123456789099, 9582071000);
insert into rel_customer_booking_details values ('B103', '2022-04-22', 'New Delhi', 'Bathinda', 3, 1, 'Bathinda', 1, 678680017897, 7837555002);
insert into rel_customer_booking_details values ('B104', '2022-02-18', 'Varanasi', 'New Delhi', 2, 2, 'Alpha 1, Greater noida', 1, 653562694977, 7734564446);
insert into rel_customer_booking_details values ('B105', '2022-03-11', 'New Delhi', 'Jammu', 1, 5, 'Jammu Tawi', 3, 785438245682, 9891477032);
insert into rel_customer_booking_details values ('B106', '2022-03-16', 'New Delhi', 'Sirhind', 2, 1, 'Shastri Nagar, Mandi Gobindgarh, Punjab', 2, 453556654321, 9999457191);
insert into rel_customer_booking_details values ('B107', '2022-03-12','New Delhi', 'Amritsar', 3, 5, 'Amritsar', 1, 914400748184, 9810073715);
insert into rel_customer_booking_details values ('B108', '2022-03-09', 'New Delhi ', 'Rewa', 1, 5, 'Rewa District', 1, 896960658332, 9910009880);
insert into rel_customer_booking_details values ('B109', '2022-03-07', 'Rewa', 'New Delhi', 1, 1, 'Lajpat nagar', 1, 123556123456, 9995467842),
('B110', '2022-03-06', 'New Delhi ', 'Chennai', 1, 1, 'Chennai', 1, 662690711413, 8056585536),
('B111', '2022-02-11', 'New Delhi ', 'Kanpur', 2, 5, 'Kidwai Nagar, Kanpur', 3, 256645664322, 8456934894),
('B112', '2022-04-13', 'New Delhi ', 'Prayagraj', 3, 1, 'Prayagraj', 1, 248669347944, 9990482001),
('B113', '2022-03-11', 'New Delhi ', 'Jodhpur JDP', 2, 2, 'City palace', 1, 123400786347, 9001703789),
('B114', '2022-11-29', 'New Delhi ', 'Palampur', 2, 4, 'Palampur, Himachal Pradesh', 3, 969068157088, 8527968193),
('B115', '2022-03-06', 'New Delhi ', 'Ujjain', 2, 1, 'Ujjain ', 1, 655201359171, 7654389533),
('B116', '2022-05-25', 'New Delhi ', 'Mumbai', 1, 1, 'Mumbai bandra', 1, 899117566666, 9867405685),
('B117', '2022-03-16', 'New Delhi ', 'Rudrapur', 1, 2, 'Gadarpur, Uttarakhand ', 1, 259004001596, 7906090208);


/* Creating Users */
create user 'divya'@'localhost' identified by 'divya';
create user 'ajay'@'localhost' identified by 'ajay';
create user 'ram'@'localhost' identified by 'ram';

/* Granting Permission to users */

/* Passenger */
GRANT select on railways.* to 'divya'@'localhost';
GRANT insert,delete,update on railways.customer_details to 'divya'@'localhost';

/* Reservation Officer */
GRANT select on railways.booking_details to 'ajay'@'localhost';
GRANT select on railways.rel_customer_booking_details to 'ajay'@'localhost';

/* TT */
GRANT select on railways.* to 'ram'@'localhost';

/* Script to create Backup */
mysqldump -u ashok -p railways > /home/ashok/Documents/Backup2.sql


                                       

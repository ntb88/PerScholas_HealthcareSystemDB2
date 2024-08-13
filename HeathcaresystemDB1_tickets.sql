use HealthcareSystemDB1;

show tables; 
-- count 
select count(*) from Patients; 
select count(*) from Appointments where Status ='Completed'; 
select count(*) from MedicalRecords where Diagnosis ='Asthma'; 

-- SUM 
select sum(TotalAmount) from Billing;  
select sum(PaidAmount) from Billing; 
select sum(BalanceAmount) from Billing where PaymentStatus = 'Unpaid'; 

-- Avg 
select AVG(TotalAmount) from Billing; 
select avg( year(current_date()) - year(DateOfBirth) ) as Age from Patients; 
select avg(PaidAmount) from Billing where PaymentStatus = 'Paid';
select avg(Dosage) from Prescriptions;

-- Min & Max 
select 
Min(AppointmentDate) as min, 
max(AppointmentDate) as Max
from Appointments; 

select Min(TotalAmount) as min, 
Max(TotalAmount) as max
from Billing;

select min(Dosage),
Max(Dosage) 
from Prescriptions;

select min(DateOfBirth), 
Max(DateOfBirth)
from Patients; 

-- case 
select TotalAmount,
	case 
		when TotalAmount > 1000 THEN 'HIGH'
        when TotalAmount >=500 AND TotalAmount <=1000 THEN 'Medium'
        ELSE 'LOW'
	END As Bills 
From Billing; 


select DateOfBirth, 
	CASE 
		WHEN (year(current_date) - year(DateOfBirth) > 65) THEN 'Senior'
		WHEN year(current_date) - year(DateOfBirth) >= 18 AND year(current_date) - year(DateOfBirth) <=65   THEN 'ADULT'
        ELSE 'Minor'
	END AS Age_Groups
From Patients; 

-- IN 

select * from Appointments 
where Status IN ('Completed' , 'Scheduled'); 

select * from Doctors 
Where Specialization IN ('Medicine', 'Cardiology', 'Pediatrics'); 

select * from MedicalRecords 
WHERE Diagnosis IN ('Diabetes', 'Hypertension', 'Asthma'); 

Select * from Departments 
WHERE DepartmentName IN('Surgery', 'Cardiology','Pediatrics');



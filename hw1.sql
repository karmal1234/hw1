CREATE OR REPLACE PROCEDURE c_manager(P_D INT , P_MANG_ID INT) AS
BEGIN 
UPDATE deptarment

    set manager_id = P_MANG_ID
        where department_id = P_D;
end;




CREATE OR REPLACE FUNCTION get_mang_name(P_D INT)
RETURN VARCHAR IS 
v_firstname emp_table.first_name%type;
v_lastname emp_table.last_name%type;

BEGIN 


select e.first_name,e.last_name into v_firstname,v_lastname
from employees e JOIN DEPARTMENT d
ON (d.MANAGER_ID = e.EMPLOYEE_ID)
where d.DEPARTMENT_ID = P_D;

RETURN  v_firstname||v_lastname;

END;
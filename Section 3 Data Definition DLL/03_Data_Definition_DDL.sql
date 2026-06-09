/* ==============================================================================
   SQL Data Definition Language (DDL)
-------------------------------------------------------------------------------
   This guide covers the essential DDL commands used for defining and managing
   database structures, including creating, modifying, and deleting tables.

   Table of Contents:
     1. CREATE - Creating Tables
     2. ALTER - Modifying Table Structure
     3. DROP - Removing Tables
=================================================================================
*/

/* ============================================================================== 
   CREATE
=============================================================================== */

/* Create a new table called persons 
   with columns: id, person_name, birth_date, and phone */
 
 Create Table  Persons
 ( 
 id INT NOT NULL PRIMARY KEY,
 person_name VARCHAR(15),
 birth_date DATE,
 phone VARCHAR(15) NOT NULL
 )


/* ============================================================================== 
   ALTER
=============================================================================== */

-- Add a new column called email to the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

SELECT * FROM Persons

-- Remove the column phone from the persons table
ALTER TABLE persons
DROP COLUMN phone

/* ============================================================================== 
   DROP
=============================================================================== */

-- Delete the table persons from the database
DROP TABLE persons
  CREATE TABLE `CHALLENGE`
   (	`C_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`C_TITLE` VARCHAR(1000),
	`C_CONTENT` VARCHAR(2000),
	`C_START` DATETIME,
	`C_FINISH` DATETIME,
	`C_TOTAL` DOUBLE,
	`C_DATE` DATETIME DEFAULT NOW()
   );

  CREATE TABLE `CHALLENGE_APPLY`
   (	`CA_NO` DOUBLE,
	`C_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`CA_ING` VARCHAR(20),
	`CA_MEMO` VARCHAR(1000)
   );


  CREATE TABLE `CHALLENGE_GOAL`
   (	`CG_NO` DOUBLE,
	`C_NO` DOUBLE,
	`E_NO` DOUBLE,
	`CG_TIME` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ERCISE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `EXERCISE`
   (	`E_NO` DOUBLE,
	`E_NAME` VARCHAR(100),
	`E_STR` VARCHAR(50),
	`E_KCAL` DOUBLE
   ) ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ERCISE_MY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `EXERCISE_MY`
   (	`EM_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`EM_DATE` DATETIME DEFAULT NOW(),
	`E_NO` DOUBLE,
	`EM_TIME` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
--  DDL for Table FOOD
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `FOOD`
   (	`F_NO` VARCHAR(20),
	`F_NAME` VARCHAR(1000),
	`F_MJCLASS` VARCHAR(500),
	`F_MNCLASS` VARCHAR(500),
	`F_ONCEOFFER` DOUBLE,
	`F_KCAL` DOUBLE,
	`F_PROTEIN` DOUBLE,
	`F_FAT` DOUBLE,
	`F_CARBO` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** OD_MY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `FOOD_MY`
   (	`FM_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`F_NO` VARCHAR(20),
	`FM_DATE` DATETIME DEFAULT NOW(),
	`FM_AMOUNT` DOUBLE,
	`R_NO` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ESTBOOK
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `GUESTBOOK`
   (	`IDX` DOUBLE,
	`NAME` VARCHAR(50),
	`EMAIL` VARCHAR(50),
	`PASSWD` VARCHAR(50),
	`CONTENT` VARCHAR(4000),
	`POST_DATE` DATETIME DEFAULT sysdate()
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** AGE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `IMAGE`
   (	`I_UUID` VARCHAR(100),
	`ORI_NO` DOUBLE,
	`I_NAME` VARCHAR(500),
	`I_DIR` VARCHAR(500),
	`I_DIV` VARCHAR(20)
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** URNAL
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `JOURNAL`
   (	`J_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`J_CONTENT` VARCHAR(2000),
	`J_DATE` DATETIME DEFAULT NOW(),
	`L_CNT` DOUBLE DEFAULT 0
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** KEYOU
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `LIKEYOU`
   (	`L_NO` DOUBLE,
	`J_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100)
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** MBER
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `MEMBER`
   (	`M_EMAIL` VARCHAR(100),
	`M_NAME` VARCHAR(100),
	`M_PW` VARCHAR(1000),
	`M_BIRTH` DATETIME,
	`M_GENDER` CHAR(1),
	`M_GRADE` VARCHAR(20),
	`M_MEAL` VARCHAR(30),
	`M_GOALTYPE` VARCHAR(300)
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** MBER_SPEC
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `MEMBER_SPEC`
   (	`MS_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`MS_DATE` DATETIME DEFAULT NOW(),
	`MS_HEIGHT` DOUBLE,
	`MS_WEIGHT` DOUBLE,
	`MS_GOAL` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** CIPE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `RECIPE`
   (	`R_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`R_TITLE` VARCHAR(1000),
	`R_CONTENT` VARCHAR(2000),
	`R_DATE` DATETIME DEFAULT NOW()
   ) ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** CIPE_GRADE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `RECIPE_GRADE`
   (	`RG_NO` DOUBLE,
	`R_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`RG_GRADE` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** CIPE_INGREDIENT
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `RECIPE_INGREDIENT`
   (	`RI_NO` DOUBLE,
	`R_NO` DOUBLE,
	`F_NO` VARCHAR(20),
	`RI_AMOUNT` DOUBLE
   );
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** PLY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE TABLE `REPLY`
   (	`RE_NO` DOUBLE,
	`ORI_NO` DOUBLE,
	`M_EMAIL` VARCHAR(100),
	`RE_CONTENT` VARCHAR(1000),
	`RE_DATE` DATETIME DEFAULT NOW(),
	`RE_DIV` VARCHAR(20),
	`RE_GROUP` DOUBLE,
	`RE_INDENT` DOUBLE
   );

  CREATE OR REPLACE VIEW `V_RECIPE_SPEC` (`R_NO`, `R_TITLE`, `SUM_KCAL`, `SUM_PROTEIN`, `SUM_FAT`, `SUM_CARBO`)  AS
  (

SELECT R.R_NO AS R_NO,
    R.R_TITLE AS R_TITLE,
    SUM(IFNULL(F_KCAL,0)) AS SUM_KCAL ,
    SUM(IFNULL(F_PROTEIN,0)) AS SUM_PROTEIN ,
    SUM(IFNULL(F_FAT,0)) AS SUM_FAT ,
    SUM(IFNULL(F_CARBO,0)) AS SUM_CARBO
FROM RECIPE R
LEFT JOIN RECIPE_INGREDIENT RI
ON R.R_NO = RI.R_NO
LEFT JOIN FOOD F
ON RI.F_NO = F.F_NO
GROUP BY R.R_NO,R.R_TITLE
 )
;

   CREATE SEQUENCE  `GUESTBOOK_SEQ` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_CA` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_CG` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_CHALLENGE` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_EM` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_EXCS` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_FM` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_FOOD` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_JOURNAL` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_LIKEYOU` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_MS` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_RECIPE` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_REPLY` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_RG` INCREMENT BY 1;
   CREATE SEQUENCE  `SEQ_RI` INCREMENT BY 1;


  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_CHALLENGE` ON `CHALLENGE` (`C_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _CHALLENGE_APPLY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_CHALLENGE_APPLY` ON `CHALLENGE_APPLY` (`CA_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _CHALLENGE_GOAL
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_CHALLENGE_GOAL` ON `CHALLENGE_GOAL` (`CG_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _EXERCISE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_EXERCISE` ON `EXERCISE` (`E_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _EXERCISE_MY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_EXERCISE_MY` ON `EXERCISE_MY` (`EM_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _FOOD
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_FOOD` ON `FOOD` (`F_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _FOOD_MY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_FOOD_MY` ON `FOOD_MY` (`FM_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _IMAGE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_IMAGE` ON `IMAGE` (`I_UUID`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _JOURNAL
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_JOURNAL` ON `JOURNAL` (`J_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _LIKE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_LIKE` ON `LIKEYOU` (`L_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _MEMBER
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_MEMBER` ON `MEMBER` (`M_EMAIL`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _MEMBER_SPEC
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_MEMBER_SPEC` ON `MEMBER_SPEC` (`MS_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _RECIPE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_RECIPE` ON `RECIPE` (`R_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _RECIPE_GRADE
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_RECIPE_GRADE` ON `RECIPE_GRADE` (`RG_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _RECIPE_INGREDIENT
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_RECIPE_INGREDIENT` ON `RECIPE_INGREDIENT` (`RI_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _REPLY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `PK_REPLY` ON `REPLY` (`RE_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _APPLY
--  SQLINES DEMO *** ------------------------------------

  -- SQLINES LICENSE FOR EVALUATION USE ONLY
  CREATE UNIQUE INDEX `UQ_APPLY` ON `CHALLENGE_APPLY` (`C_NO`, `M_EMAIL`)
  ;


  ALTER TABLE `RECIPE_GRADE` MODIFY (`RG_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_GRADE` MODIFY (`R_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_GRADE` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_GRADE` MODIFY (`RG_GRADE` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_GRADE` ADD CONSTRAINT `PK_RECIPE_GRADE` PRIMARY KEY (`RG_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table JOURNAL
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `JOURNAL` MODIFY (`J_NO` NOT NULL ENABLE);
  ALTER TABLE `JOURNAL` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `JOURNAL` MODIFY (`J_CONTENT` NOT NULL ENABLE);
  ALTER TABLE `JOURNAL` ADD CONSTRAINT `PK_JOURNAL` PRIMARY KEY (`J_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table CHALLENGE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE` MODIFY (`C_NO` NOT NULL ENABLE);
  ALTER TABLE `CHALLENGE` ADD CONSTRAINT `PK_CHALLENGE` PRIMARY KEY (`C_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table MEMBER
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `MEMBER` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` MODIFY (`M_NAME` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` MODIFY (`M_PW` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` MODIFY (`M_BIRTH` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` MODIFY (`M_GENDER` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` MODIFY (`M_GRADE` NOT NULL ENABLE);
  ALTER TABLE `MEMBER` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (`M_EMAIL`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table MEMBER_SPEC
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `MEMBER_SPEC` MODIFY (`MS_NO` NOT NULL ENABLE);
  ALTER TABLE `MEMBER_SPEC` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `MEMBER_SPEC` MODIFY (`MS_HEIGHT` NOT NULL ENABLE);
  ALTER TABLE `MEMBER_SPEC` MODIFY (`MS_WEIGHT` NOT NULL ENABLE);
  ALTER TABLE `MEMBER_SPEC` MODIFY (`MS_GOAL` NOT NULL ENABLE);
  ALTER TABLE `MEMBER_SPEC` ADD CONSTRAINT `PK_MEMBER_SPEC` PRIMARY KEY (`MS_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table CHALLENGE_APPLY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE_APPLY` MODIFY (`CA_NO` NOT NULL ENABLE);
  ALTER TABLE `CHALLENGE_APPLY` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `CHALLENGE_APPLY` MODIFY (`CA_ING` NOT NULL ENABLE);
  ALTER TABLE `CHALLENGE_APPLY` ADD CONSTRAINT `PK_CHALLENGE_APPLY` PRIMARY KEY (`CA_NO`)
  ;
  ALTER TABLE `CHALLENGE_APPLY` ADD CONSTRAINT `UQ_APPLY` UNIQUE (`C_NO`, `M_EMAIL`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table FOOD
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `FOOD` MODIFY (`F_NO` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_NAME` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_MJCLASS` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_MNCLASS` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_ONCEOFFER` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_KCAL` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_PROTEIN` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_FAT` NOT NULL ENABLE);
  ALTER TABLE `FOOD` MODIFY (`F_CARBO` NOT NULL ENABLE);
  ALTER TABLE `FOOD` ADD CONSTRAINT `PK_FOOD` PRIMARY KEY (`F_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table CHALLENGE_GOAL
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE_GOAL` MODIFY (`CG_NO` NOT NULL ENABLE);
  ALTER TABLE `CHALLENGE_GOAL` ADD CONSTRAINT `PK_CHALLENGE_GOAL` PRIMARY KEY (`CG_NO`)
  ;
  ALTER TABLE `CHALLENGE_GOAL` MODIFY (`CG_TIME` NOT NULL ENABLE);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table EXERCISE_MY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `EXERCISE_MY` MODIFY (`EM_NO` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE_MY` MODIFY (`E_NO` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE_MY` MODIFY (`EM_TIME` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE_MY` ADD CONSTRAINT `PK_EXERCISE_MY` PRIMARY KEY (`EM_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table FOOD_MY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `FOOD_MY` MODIFY (`FM_NO` NOT NULL ENABLE);
  ALTER TABLE `FOOD_MY` MODIFY (`FM_AMOUNT` NOT NULL ENABLE);
  ALTER TABLE `FOOD_MY` ADD CONSTRAINT `PK_FOOD_MY` PRIMARY KEY (`FM_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table RECIPE_INGREDIENT
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `RECIPE_INGREDIENT` MODIFY (`RI_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_INGREDIENT` MODIFY (`R_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_INGREDIENT` MODIFY (`F_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_INGREDIENT` MODIFY (`RI_AMOUNT` NOT NULL ENABLE);
  ALTER TABLE `RECIPE_INGREDIENT` ADD CONSTRAINT `PK_RECIPE_INGREDIENT` PRIMARY KEY (`RI_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table GUESTBOOK
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `GUESTBOOK` MODIFY (`IDX` NOT NULL ENABLE);
  ALTER TABLE `GUESTBOOK` MODIFY (`NAME` NOT NULL ENABLE);
  ALTER TABLE `GUESTBOOK` MODIFY (`EMAIL` NOT NULL ENABLE);
  ALTER TABLE `GUESTBOOK` MODIFY (`PASSWD` NOT NULL ENABLE);
  ALTER TABLE `GUESTBOOK` MODIFY (`CONTENT` NOT NULL ENABLE);
  ALTER TABLE `GUESTBOOK` ADD PRIMARY KEY (`IDX`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table EXERCISE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `EXERCISE` MODIFY (`E_NO` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE` MODIFY (`E_NAME` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE` MODIFY (`E_STR` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE` MODIFY (`E_KCAL` NOT NULL ENABLE);
  ALTER TABLE `EXERCISE` ADD CONSTRAINT `PK_EXERCISE` PRIMARY KEY (`E_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table LIKEYOU
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `LIKEYOU` MODIFY (`L_NO` NOT NULL ENABLE);
  ALTER TABLE `LIKEYOU` MODIFY (`J_NO` NOT NULL ENABLE);
  ALTER TABLE `LIKEYOU` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `LIKEYOU` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (`L_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table REPLY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `REPLY` MODIFY (`RE_NO` NOT NULL ENABLE);
  ALTER TABLE `REPLY` ADD CONSTRAINT `PK_REPLY` PRIMARY KEY (`RE_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table RECIPE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `RECIPE` MODIFY (`R_NO` NOT NULL ENABLE);
  ALTER TABLE `RECIPE` MODIFY (`M_EMAIL` NOT NULL ENABLE);
  ALTER TABLE `RECIPE` MODIFY (`R_TITLE` NOT NULL ENABLE);
  ALTER TABLE `RECIPE` MODIFY (`R_CONTENT` NOT NULL ENABLE);
  ALTER TABLE `RECIPE` ADD CONSTRAINT `PK_RECIPE` PRIMARY KEY (`R_NO`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** Table IMAGE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `IMAGE` MODIFY (`I_UUID` NOT NULL ENABLE);
  ALTER TABLE `IMAGE` MODIFY (`I_DIR` NOT NULL ENABLE);
  ALTER TABLE `IMAGE` MODIFY (`I_DIV` NOT NULL ENABLE);
  ALTER TABLE `IMAGE` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (`I_UUID`)
  ;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table CHALLENGE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE` ADD CONSTRAINT `FK_M_EMAIL_CHALLENGE` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table CHALLENGE_APPLY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE_APPLY` ADD CONSTRAINT `FK_M_EMAIL_CHALLENGE_APPLY` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
  ALTER TABLE `CHALLENGE_APPLY` ADD CONSTRAINT `FK_C_NO_CHALLENGE_APPLY` FOREIGN KEY (`C_NO`)
	  REFERENCES `CHALLENGE` (`C_NO`) ON DELETE CASCADE;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table CHALLENGE_GOAL
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `CHALLENGE_GOAL` ADD CONSTRAINT `FK_C_NO_CHALLENGE_GOAL` FOREIGN KEY (`C_NO`)
	  REFERENCES `CHALLENGE` (`C_NO`) ON DELETE CASCADE;
  ALTER TABLE `CHALLENGE_GOAL` ADD CONSTRAINT `FK_E_NO_CHALLENGE_GOAL` FOREIGN KEY (`E_NO`)
	  REFERENCES `EXERCISE` (`E_NO`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table EXERCISE_MY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `EXERCISE_MY` ADD CONSTRAINT `FK_M_EMAIL_EXERCISE_MY` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
  ALTER TABLE `EXERCISE_MY` ADD CONSTRAINT `FK_E_NO_EXERCISE_MY` FOREIGN KEY (`E_NO`)
	  REFERENCES `EXERCISE` (`E_NO`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table FOOD_MY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `FOOD_MY` ADD CONSTRAINT `FK_M_EMAIL_FOOD_MY` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
  ALTER TABLE `FOOD_MY` ADD CONSTRAINT `FK_F_NO_FOOD_MY` FOREIGN KEY (`F_NO`)
	  REFERENCES `FOOD` (`F_NO`);
  ALTER TABLE `FOOD_MY` ADD CONSTRAINT `FK_R_NO_FOOD_MY` FOREIGN KEY (`R_NO`)
	  REFERENCES `RECIPE` (`R_NO`) ON DELETE CASCADE;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table JOURNAL
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `JOURNAL` ADD CONSTRAINT `FK_M_EMAIL_JOURNAL` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table LIKEYOU
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `LIKEYOU` ADD CONSTRAINT `FK_M_EMAIL_LIKEYOU` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
  ALTER TABLE `LIKEYOU` ADD CONSTRAINT `FK_J_NO_LIKEYOU` FOREIGN KEY (`J_NO`)
	  REFERENCES `JOURNAL` (`J_NO`) ON DELETE CASCADE;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table MEMBER_SPEC
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `MEMBER_SPEC` ADD CONSTRAINT `FK_M_EMAIL_MEMBER_SPEC` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table RECIPE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `RECIPE` ADD CONSTRAINT `FK_M_EMAIL_RECIPE` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table RECIPE_GRADE
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `RECIPE_GRADE` ADD CONSTRAINT `FK_M_EMAIL_RECIPE_GRADE` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
  ALTER TABLE `RECIPE_GRADE` ADD CONSTRAINT `FK_R_NO_RECIPE_GRADE` FOREIGN KEY (`R_NO`)
	  REFERENCES `RECIPE` (`R_NO`) ON DELETE CASCADE;
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table RECIPE_INGREDIENT
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `RECIPE_INGREDIENT` ADD CONSTRAINT `FK_R_NO_RECIPE_INGREDIENT` FOREIGN KEY (`R_NO`)
	  REFERENCES `RECIPE` (`R_NO`);
  ALTER TABLE `RECIPE_INGREDIENT` ADD CONSTRAINT `FK_F_NO_RECIPE_INGREDIENT` FOREIGN KEY (`F_NO`)
	  REFERENCES `FOOD` (`F_NO`);
--  SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** for Table REPLY
--  SQLINES DEMO *** ------------------------------------

  ALTER TABLE `REPLY` ADD CONSTRAINT `FK_M_EMAIL_REPLY` FOREIGN KEY (`M_EMAIL`)
	  REFERENCES `MEMBER` (`M_EMAIL`);
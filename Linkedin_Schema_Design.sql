create database linkedin;
use linkedin;

/* Creating User Table*/

CREATE TABLE user (
    UserID INT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL,
    password INT NOT NULL,
    headline VARCHAR(250),
    about VARCHAR(1000),
    location VARCHAR(100),
    phone_number INT NOT NULL,
    CONSTRAINT UserUID PRIMARY KEY (UserID)
);
/*Creating User Experience Table*/

CREATE TABLE experience (
    ExpID INT,
    UserID INT,
    title VARCHAR(250) NOT NULL,
    company VARCHAR(250) NOT NULL,
    location VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    description VARCHAR(1000),
    CONSTRAINT ExpEID PRIMARY KEY (ExpID),
    CONSTRAINT EUID FOREIGN KEY (UserID)
        REFERENCES user (UserID)
);

alter table experience
modify column UserID int not null;

/*Creating User Education table*/

CREATE TABLE education (
    Edu_ID INT,
    User_ID INT NOT NULL,
    institution VARCHAR(100) NOT NULL,
    degree VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    description VARCHAR(250),
    CONSTRAINT Ed_EID PRIMARY KEY (Edu_ID),
    CONSTRAINT Ed_UserID FOREIGN KEY (User_ID)
        REFERENCES user (UserID)
);

/*Creating Skills table*/

CREATE TABLE skills (
    Skill_ID INT,
    Name VARCHAR(100) NOT NULL,
    CONSTRAINT S_SKID PRIMARY KEY (Skill_ID)
);

/*Creating Table UserSkills*/

CREATE TABLE User_Skills (
    User_ID INT NOT NULL,
    Skill_ID INT NOT NULL,
    CONSTRAINT US_UID FOREIGN KEY (User_ID)
        REFERENCES user (UserID),
    CONSTRAINT US_SKID FOREIGN KEY (Skill_ID)
        REFERENCES skills (Skill_ID)
);

/*Creating Endorsement Tabel*/

CREATE TABLE endorse (
    Endorse_ID INT,
    End_UserID INT NOT NULL,
    End_BY_UserID INT NOT NULL,
    SkillID INT NOT NULL,
    CONSTRAINT EndorseID PRIMARY KEY (Endorse_ID),
    CONSTRAINT End_UID FOREIGN KEY (End_UserID)
        REFERENCES user (UserID),
    CONSTRAINT End_SKID FOREIGN KEY (SkillID)
        REFERENCES User_Skills (Skill_ID)
);

/*Creating Connections table*/

CREATE TABLE Connections (
    Connect_ID INT,
    UserID_1 INT NOT NULL,
    UserID_2 INT NOT NULL,
    Status VARCHAR(100) NOT NULL,
    ConnectedDate DATE,
    CONSTRAINT C_CID PRIMARY KEY (Connect_ID),
    CONSTRAINT Con_UID1 FOREIGN KEY (UserID_1)
        REFERENCES user (UserID),
    CONSTRAINT Con_UID2 FOREIGN KEY (UserID_2)
        REFERENCES user (UserID)
);

/*Craeting User Post Table*/

CREATE TABLE post (
    PostID INT,
    UserID INT NOT NULL,
    Content VARCHAR(350) NOT NULL,
    Image_URL VARCHAR(250),
    Post_Date DATE NOT NULL,
    CONSTRAINT P_PID PRIMARY KEY (PostID),
    CONSTRAINT P_UID FOREIGN KEY (UserID)
        REFERENCES user (UserID)
);

/*creating comments table */

CREATE TABLE comment (
    CommentID INT,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    content VARCHAR(250) NOT NULL,
    comment_date DATE NOT NULL,
    CONSTRAINT Com_CID PRIMARY KEY (CommentID),
    CONSTRAINT Com_PID FOREIGN KEY (PostID)
        REFERENCES post (PostID),
    CONSTRAINT Com_UID FOREIGN KEY (UserID)
        REFERENCES user (UserID)
);

/*Creating Likes table*/

CREATE TABLE likes (
    LikeID INT,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT L_LID PRIMARY KEY (LikeID),
    CONSTRAINT L_PID FOREIGN KEY (PostID)
        REFERENCES post (PostID),
    CONSTRAINT L_UID FOREIGN KEY (UserID)
        REFERENCES user (UserID)
);

/*Creating Messages table*/

CREATE TABLE message (
    MessageID INT,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    Messeged_Text VARCHAR(500) NOT NULL,
    Message_datetime DATETIME NOT NULL,
    CONSTRAINT M_MID PRIMARY KEY (MessageID),
    CONSTRAINT M_SID FOREIGN KEY (SenderID)
        REFERENCES user (UserID),
    CONSTRAINT M_RID FOREIGN KEY (ReceiverID)
        REFERENCES user (UserID)
);

/*Creating company table*/

CREATE TABLE company (
    CompanyID INT,
    Name VARCHAR(150) NOT NULL,
    Description VARCHAR(250) NOT NULL,
    website VARCHAR(150) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    CONSTRAINT Company_CID PRIMARY KEY (CompanyID)
);

/*creating job table*/

CREATE TABLE job (
    JobID INT,
    CompanyID INT NOT NULL,
    Title VARCHAR(150) NOT NULL,
    Description VARCHAR(1000) NOT NULL,
    posted_date DATE NOT NULL,
    CONSTRAINT J_JID PRIMARY KEY (JobID),
    CONSTRAINT Comp_CID FOREIGN KEY (CompanyID)
        REFERENCES company (CompanyID)
);

/*Creating Application Table*/

CREATE TABLE application (
    App_ID INT,
    UserID INT NOT NULL,
    JobID INT NOT NULL,
    Appli_Date DATE NOT NULL,
    Status VARCHAR(100) NOT NULL,
    CONSTRAINT AID PRIMARY KEY (App_ID),
    CONSTRAINT A_UID FOREIGN KEY (UserID)
        REFERENCES user (UserID),
    CONSTRAINT A_PID FOREIGN KEY (JobID)
        REFERENCES job (JobID)
);

/*creating notification table*/

CREATE TABLE notification (
    Notify_ID INT,
    UserID INT NOT NULL,
    content VARCHAR(150) NOT NULL,
    Is_Read BOOLEAN NOT NULL,
    creation_time DATETIME NOT NULL,
    CONSTRAINT NID PRIMARY KEY (Notify_ID),
    CONSTRAINT N_UID FOREIGN KEY (UserID)
        REFERENCES user (UserID)
);  

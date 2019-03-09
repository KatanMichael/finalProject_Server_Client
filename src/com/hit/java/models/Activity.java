package com.hit.java.models;


import org.hibernate.annotations.Entity;

@Entity
public class Activity {
    private int id;
    private int userId;
    private int ScheuleID;

    public Activity(int id, int userId, int scheuleID) {
        this.id = id;
        this.userId = userId;
        ScheuleID = scheuleID;
    }

    public Activity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getScheduleID() {
        return ScheduleID;
    }

    public void setScheduleID(int scheduleID) {
        ScheduleID = scheduleID;
    }
}

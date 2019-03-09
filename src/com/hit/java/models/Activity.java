package com.hit.java.models;


import org.hibernate.annotations.Entity;

@Entity
public class Activity {
    private int id;
    private int userId;
    private int scheuleId;

    public Activity(int userId, int scheuleId) {
        this.id = id;
        this.userId = userId;
        this.scheuleId = scheuleId;
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
        return scheuleId;
    }

    public void setScheduleID(int scheduleID) {
        scheuleId = scheduleID;
    }
}

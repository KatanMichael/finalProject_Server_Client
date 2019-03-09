package com.hit.java.models;


import org.hibernate.annotations.Entity;

@Entity
public class Activity
{
    private int id;
    private String name;
    private String date;
    private int startTime;
    private int endTime;
    private int userId;

    public Activity(){}

    public Activity(int userId, String name, String date, int startTime, int endTime)
    {
        this.userId = userId;
        this.name = name;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        this.endTime = endTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int numberOfSets) {
        this.startTime = numberOfSets;
    }
}

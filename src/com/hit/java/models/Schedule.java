package com.hit.java.models;

import org.hibernate.annotations.Entity;


@Entity
public class Schedule {

    private int id;
    private int activityId;
    private String name;
    private int day;
    private int start;
    private int end;

    public Schedule(){}

    public Schedule(int activityId, String name, int day, int start, int end) {
        this.activityId = activityId;
        this.name = name;
        this.day = day;
        this.start = start;
        this.end = end;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "activityId=" + activityId +
                ", name='" + name + '\'' +
                ", day=" + day +
                ", start=" + start +
                ", end=" + end +
                '}';
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public void setActivityId(int activityId) {
        this.activityId = activityId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getActivityId() {
        return activityId;
    }

    public String getName() {
        return name;
    }

    public int getDay() {
        return day;
    }

    public int getStart() {
        return start;
    }

    public int getEnd() {
        return end;
    }
}

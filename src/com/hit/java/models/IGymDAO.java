package com.hit.java.models;

import java.util.List;

public interface IGymDAO
{
    //Users
    public void getAllUsers(RequestListener listener);
    public User getUserbyId(int queryId, RequestListener listener);
    public List getUsersByName(String name, RequestListener listener);
    public void getUserByWeight(double weight, RequestListener listener);
    public void getUserByHeight(double height, RequestListener listener);
    public void addNewUser(User user);
    public void deleteUser(String userName);
    public void updateUser(User user);

    //Activities
    public void getAllActivities(RequestListener listener);
    public void getActivityById(int id, RequestListener listener);
    public void getActivitiesByUserId(int userId, RequestListener listener);
    public void addNewActivity(Activity activity);

    //schedule
    public void addNewSchedule(Schedule schedule);
    public void getScheduleById(int id, RequestListener listener);
    public void getScheduleByDay(int day, RequestListener listener);

}



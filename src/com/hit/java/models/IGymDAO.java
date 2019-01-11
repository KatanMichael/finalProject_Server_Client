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

    /*
    Keywords are "equal", "above", "below"
     */

    //Activities
    public void getActivityById(int id, RequestListener listener);
    public void getActivitiesByName(String name, RequestListener listener);
    public void getActivitiesBySets(boolean hasSets, RequestListener listener);

    public void addNewActivity(Activity activity);

}



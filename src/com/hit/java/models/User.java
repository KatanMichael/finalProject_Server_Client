package com.hit.java.models;

public class User
{
    private int id;
    private String password;
    private String userName;
    private double weight;
    private double height;

    public User(){}

    public User(String password, String userName, double weight, double height) {
        this.password = password;
        this.userName = userName;
        this.weight = weight;
        this.height = height;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", userName='" + userName + '\'' +
                ", weight=" + weight +
                ", height=" + height +
                '}';
    }

}

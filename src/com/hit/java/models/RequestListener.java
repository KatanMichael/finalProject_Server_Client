package com.hit.java.models;

public interface RequestListener <T>
{
    void onComplete(T t);
    void onError(String errorMsg);

}

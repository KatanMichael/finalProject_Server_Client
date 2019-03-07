package com.hit.java.models;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import java.util.List;

public class HibernateGymDAO implements IGymDAO
{
    private static HibernateGymDAO ourInstance = new HibernateGymDAO();
    private SessionFactory sessionFactory;


    public static HibernateGymDAO getInstance() {
        if (ourInstance == null) {
            ourInstance = new HibernateGymDAO();
        }
        return ourInstance;
    }

    private HibernateGymDAO() {
    }


    @Override
    public void getAllUsers(RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        List from_user;

        try {
            from_user = session.createQuery("from User ").list();
            listener.onComplete(from_user);
        }catch (HibernateException e)
        {
            listener.onError(e.getMessage());
        }



        session.close();
        sessionFactory.close();

    }

    @Override
    public User getUserbyId(int queryId, RequestListener listener)
    {
        sessionFactory =  new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        final List list = session.createQuery("from User u WHERE u.id = '"+queryId+"'").list();

        if(list.size() == 0)
        {
            listener.onError("No User Found");
            return null;
        }else
        {
            User tempUser = (User) list.get(0);
            return tempUser;

        }

    }

    @Override
    public List getUsersByName(String name, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from User u WHERE u.userName = '"+name+"'").list();

        if(list.size() == 0)
        {
            listener.onError("No User Found");
            return null;

        }else
        {
            listener.onComplete(list);
            return list;
        }

    }

    @Override
    public void getUserByWeight(double weight, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from User u WHERE u.weight = '" + weight + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No User Found");

        }else
        {
            listener.onComplete(list);
        }
    }

    @Override
    public void getUserByHeight(double height, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from User u WHERE u.height = '" + height + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No User Found");

        }else
        {
            listener.onComplete(list);
        }

    }

    @Override
    public void addNewUser(User user)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        try {
            session.beginTransaction();

        session.save(user);

        session.getTransaction().commit();

        session.close();

        sessionFactory.close();
        }catch (HibernateException e)
        {
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }

    }

    @Override
    public void deleteUser(String userName)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        getUsersByName(userName, new RequestListener()
        {
            @Override
            public void onComplete(Object o)
            {
                List userList = (List) o;

                for (int i = 0; i <userList.size() ; i++)
                {
                    session.delete(userList.get(i));
                    session.getTransaction().commit();
                }
            }

            @Override
            public void onError(String errorMsg)
            {
                System.out.println(errorMsg);
            }
        });



    }

    @Override
    public void updateUser(User user)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        session.update(user);
        session.getTransaction().commit();

        session.close();

        sessionFactory.close();

    }

    @Override
    public void getActivityById(int id, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Activity a WHERE a.id = '" + id + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }

    }

    @Override
    public void getActivitiesByName(String name, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Activity a WHERE a.name = '" + name + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }

    }

    @Override
    public void getActivitiesBySets(boolean hasSets, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Activity a WHERE a.hasSets = '" + hasSets + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }

    }

    public void getActivitiesByUserId(int userId, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Activity a WHERE a.userId = '" + userId + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }

    }
    @Override
    public void addNewActivity(Activity activity)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        session.save(activity);

        session.getTransaction().commit();

        session.close();

        sessionFactory.close();
    }
}

//TODO Fill blanks Methods
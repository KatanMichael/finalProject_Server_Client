package com.hit.java.models;

import org.hibernate.HibernateException;
import org.hibernate.Query;
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

    private HibernateGymDAO() { }


    /**
     *
     * @param listener - Callback interface
     */
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

    /**
     *
     * @param userId - userId for database Query
     * @param listener - Callback interface
     * @return
     */
    @Override
    public User getUserbyId(int userId, RequestListener listener)
    {
        sessionFactory =  new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        final List list = session.createQuery("from User u WHERE u.id = '"+userId+"'").list();

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

    /**
     *
     * @param name - userName for Query
     * @param listener - Callback interface
     * @return
     */
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

    /**
     *
     * @param weight -User weight for Query
     * @param listener - Callback interface
     */
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

    /**
     *
     * @param height - user height for Query
     * @param listener - Callback interface
     */
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

    /**
     * The Method added new user to the database
     * @param user - adding the user to the database
     */
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

    /**
     *
     * @param userName - userName to delete from the dataBae
     */
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

    /**
     *
     * @param user - user to update in the database
     */
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

    /**
     *
     * @param id - get specific activity by id
     * @param listener - Callback interface
     */
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


    /**
     *
     * @param userId - get all the activities of specific user
     * @param listener - Callback interface
     */
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

    /**
     * The method retrieve all the activities in the dataBase
     * @param listener - Callback interface
     */
    public void getAllActivities(RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        List from_activity;

        try {
            from_activity = session.createQuery("from Activity ").list();
            listener.onComplete(from_activity);
        }catch (HibernateException e)
        {
            listener.onError(e.getMessage());
        }
        session.close();
        sessionFactory.close();
    }

    /**
     * The Method add new activity to the database
     * @param activity - new activity to add to the database
     */
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

    /**
     *The method remove spacific activity from the database
     * @param activity - activity to remove from the database
     */
    @Override
    public void removeActivityById(Activity activity)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        session.delete(activity);

        session.getTransaction().commit();

        session.close();
        sessionFactory.close();
    }

    /**
     *
     * @param schedule - Add new schedule to the database
     */
    @Override
    public void addNewSchedule(Schedule schedule)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        session.save(schedule);

        session.getTransaction().commit();

        session.close();

        sessionFactory.close();


    }

    /**
     *
     * @param id - get specific Schedule by id
     * @param listener - Callback interface
     */
    @Override
    public void getScheduleById(int id, RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Schedule s WHERE s.id = '" + id + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }

    }

    /**
     *
     * @param day - get all the Schedule on a specific day
     * @param listener - Callback interface
     */
    @Override
    public void getScheduleByDay(int day, RequestListener listener)
    {

        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        final List list = session.createQuery("from Schedule s WHERE s.day = '" + day + "' ").list();

        if(list.size() == 0)
        {
            listener.onError("No Activity Found");

        }else
        {
            listener.onComplete(list);
        }
    }

    /**
     * The method retrieve all the gym Schedule
     * @param listener - Callback interface
     */
    public void getAllSchedule(RequestListener listener)
    {
        sessionFactory = new AnnotationConfiguration().
                configure().buildSessionFactory();

        Session session = sessionFactory.openSession();

        session.beginTransaction();

        List schedule;

        try {
            schedule = session.createQuery("from Schedule ").list();
            listener.onComplete(schedule);
        }catch (HibernateException e)
        {
            listener.onError(e.getMessage());
        }



        session.close();
        sessionFactory.close();

    }
}

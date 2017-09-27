package web_src;

import mapping.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.TransactionException;

import java.util.List;

public class SearchBrain {

    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();
    private Transaction transaction;

    public SearchBrain(){

    }

    public List<User> getUsers(){
        Session session = sessionFactory.openSession();
        transaction = session.beginTransaction();
        List<User> users = null;
        try{
            users = session.createCriteria(User.class).list();
            transaction.commit();
        }catch (TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }

        return users;
    }

    public Object getAds(Object object, long id){
        Session session = sessionFactory.openSession();
        Transaction transaction1 = session.beginTransaction();
        Object objectReturn = null;
        try{
            objectReturn = session.get(object.getClass(), id);
            transaction1.commit();
        }catch (TransactionException te){
            te.getMessage();
            transaction1.rollback();
        }finally {
            session.close();
        }

        return objectReturn;
    }
}

package web_src;

import mapping.*;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

public class UserAds {

    private static SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();
    private Session session;

    public UserAds(){

    }

    public boolean addAds(Object object){
        boolean t = false;
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.save(object);
            transaction.commit();
            t = true;
        }catch(TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }
        return t;
    }

    public List<Object[]> readAds(long id){
        List<Object[]> list = new ArrayList<>();
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            Criteria criteria = session.createCriteria(User.class);
            criteria.add(Restrictions.eq("id", id));
            User user = (User) criteria.uniqueResult();
                list.add(user.getHouses().toArray());
                list.add(user.getTablets().toArray());
                list.add(user.getApartments().toArray());
                list.add(user.getPhones().toArray());
                list.add(user.getMotorcycles().toArray());
                list.add(user.getNotebooks().toArray());
                list.add(user.getCars().toArray());
                transaction.commit();
        }catch(TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }

        return list;
    }

    public void updateAds(Object object){
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.update(object);
            transaction.commit();
        }catch(TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally{
            session.close();
        }
    }

    public boolean deleteAds(long id, String type){
        session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        boolean t = false;

        try{
            if(type.equalsIgnoreCase("house")){
                House house = session.get(House.class, id);
                session.delete(house);
                t = true;
            }else if(type.equalsIgnoreCase("tablet")){
                Tablet tablet = session.get(Tablet.class, id);
                session.delete(tablet);
                t = true;
            }else if(type.equalsIgnoreCase("apartment")){
                Apartment apartment = session.get(Apartment.class, id);
                session.delete(apartment);
                t = true;
            }else if(type.equalsIgnoreCase("phone")){
                Phone phone = session.get(Phone.class, id);
                session.delete(phone);
                t = true;
            }else if(type.equalsIgnoreCase("motorcycle")){
                Motorcycle motorcycle = session.get(Motorcycle.class, id);
                session.delete(motorcycle);
                t = true;
            }else if(type.equalsIgnoreCase("notebook")){
                Notebook notebook = session.get(Notebook.class, id);
                session.delete(notebook);
                t = true;
            }else if(type.equalsIgnoreCase("car")){
                Car car = session.get(Car.class, id);
                session.delete(car);
                t = true;
            }
            transaction.commit();
        }catch (TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally{
            session.close();
        }

        return t;
    }
}

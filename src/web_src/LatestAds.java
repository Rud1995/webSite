package web_src;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class LatestAds {

    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();

    public LatestAds(){
        super();
    }

    public Object getLatestAds(Object object){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Object object1 = null;
        try{
            Criteria criteria = session.createCriteria(object.getClass());
            object1 = criteria.addOrder(Order.desc("id")).setMaxResults(1).uniqueResult();
            transaction.commit();
        }catch(TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }

        return object1;
    }
}

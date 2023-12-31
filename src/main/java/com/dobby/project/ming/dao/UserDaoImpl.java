package com.dobby.project.ming.dao;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.*;
import com.dobby.project.soo.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.dao.UserMapper.";

    @Override
    public int deleteUser(String MBR_ID) throws Exception {
        return session.delete(namespace+"deleteUser", MBR_ID);
    }

    @Override
    public List<UserDto> memberList() throws Exception {
        return session.selectList(namespace + "memberList");
    }
    public UserDto selectUser(String MBR_ID) throws Exception {
        return session.selectOne(namespace + "selectUser", MBR_ID);
    }
    @Override
       public List<UserDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }
    @Override
    public int insertUser(User user) throws Exception {
        return session.insert(namespace+"insertUser", user);
    }
    @Override
    public int updateUser(User user) throws Exception {
        return session.update(namespace+"updateUser", user);
    }
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }
    @Override
    public void deleteAll() {
    }
}
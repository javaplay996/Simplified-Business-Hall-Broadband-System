package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.transaction.annotation.Transactional;
import com.utils.PageUtils;
import com.utils.Query;

import com.dao.YonghuxinxiDao;
import com.entity.YonghuxinxiEntity;
import com.service.YonghuxinxiService;
import com.entity.view.YonghuxinxiView;

/**
 *  服务实现类
 * @author 
 * @since 2021-02-03
 */
@Service("yonghuxinxiService")
@Transactional
public class YonghuxinxiServiceImpl extends ServiceImpl<YonghuxinxiDao, YonghuxinxiEntity> implements YonghuxinxiService {

    @Override
    public PageUtils queryPage(Map<String,Object> params) {
        if(params != null && (params.get("limit") == null || params.get("page") == null)){
            params.put("page","1");
            params.put("limit","10");
        }
        Page<YonghuxinxiView> page =new Query<YonghuxinxiView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,params));
        return new PageUtils(page);
    }

}

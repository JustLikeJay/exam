<template>
    <div class="user-evaluate-item" v-if="item">
        <el-row class="user-evaluate-item-bg">
            <el-col :span="2">
                <img width="40" height="40" class="user-evaluate-item-avatar" :src="item.avatarUrl ? item.avatarUrl:'https://yunmianshi.com/attach-storage/yunmianshi/default/124/user.png'">
            </el-col>
            <el-col :span="22">
                <div class="user-evaluate-item-top">
                    <span style="color: #333; margin-right: 15px;">{{ item.operatorName }}</span>
                    <el-rate v-model="item.evaluateLevel" :disabled="true" style="height: 100%; line-height: initial;"></el-rate>
                </div>
                <div class="user-evaluate-item-content" style="color:#666;">
                    {{ item.evaluateContent }}
                </div>
                <div class="user-evaluate-item-time">
                    {{ item.createTime }}
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
export default {
  name: 'EvaluateItem',
  props: {
    item: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
.user-evaluate-item {
  margin-top: 26px;
  .user-evaluate-item-bg {
    border-bottom: 1px solid rgba(233,233,233,.6);
    padding-bottom: 20px;
  }
  .user-evaluate-item-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
  .user-evaluate-item-top{
    font-size: 13px;
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 23px;
  }
}
.user-evaluate-item-content {
  margin-top: 8px;
}
.user-evaluate-item-time {
  font-size: 12px;
  margin-top: 10px;
  color: #999;
}
</style>

<template>
  <div id="password">
    <el-row class="password-msg">
      <el-col :span="24" style="color: black;">
        <h1>修改密码</h1>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="20" :offset="2" style="margin-top:10px;">
        <el-card class="box-card">
          <el-form ref="form" :rules="rules" :label-position="labelPosition" :model="userInfo"
                   label-width="140px" style="width: 90%;">
            <el-row>
              <el-col :span="12" :offset="6">
                <el-form-item :label="$t('username') + '：'" prop="identifier">
                  <el-input v-model="userInfo.identifier" auto-complete="off" type="identifier"/>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12" :offset="6">
                <el-form-item :label="$t('oldPassword') + '：'" prop="oldPassword">
                  <el-input v-model="userInfo.oldPassword" auto-complete="off" type="password"/>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12" :offset="6">
                <el-form-item :label="$t('newPassword') + '：'" prop="newPassword">
                  <el-input v-model="userInfo.newPassword" auto-complete="off" type="password"/>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12" :offset="6">
                <el-form-item :label="$t('confirm') + '：'" prop="newPassword1">
                  <el-input v-model="userInfo.newPassword1" auto-complete="off" type="password"/>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12" :offset="8">
                <el-form-item>
                  <el-button type="primary" @click="update">{{$t('save')}}</el-button>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import OFooter from '../common/footer'
import { updatePassword } from '@/api/admin/user'
import { mapState } from 'vuex'
import { notifySuccess, notifyFail, isNotEmpty } from '@/utils/util'

export default {
  data () {
    const validatePass = (rule, value, callback) => {
      if (this.userInfo.oldPassword !== '') {
        if (!isNotEmpty(value)) {
          callback(new Error('请输入新密码'))
        } else if (value.length < 6) {
          callback(new Error('密码不能小于6位'))
        } else {
          callback()
        }
      } else {
        callback()
      }
    }
    const validatePass1 = (rule, value, callback) => {
      if (this.userInfo.oldPassword !== '') {
        if (!isNotEmpty(value)) {
          callback(new Error('请再次输入密码'))
        } else if (value !== this.userInfo.newPassword) {
          callback(new Error('两次输入密码不一致！'))
        } else {
          callback()
        }
      } else {
        callback()
      }
    }
    return {
      labelPosition: 'right',
      rules: {
        identifier: [{ required: true, message: '请输入账号', trigger: 'blur' }],
        oldPassword: [{ required: true, message: '请输入旧密码', trigger: 'blur' }],
        newPassword: [{ required: true, validator: validatePass, trigger: 'blur' }],
        newPassword1: [{ required: true, validator: validatePass1, trigger: 'blur' }]
      },
      readOnly: false
    }
  },
  components: {
    OFooter
  },
  computed: {
    ...mapState({
      userInfo: state => state.user.userInfo
    })
  },
  methods: {
    update () {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          updatePassword(this.userInfo).then(response => {
            if (response.data.result) {
              notifySuccess(this, '修改成功')
              this.$router.push({ path: '/login' })
            } else {
              notifyFail(this, response.data.message)
            }
          }).catch(() => {
            notifyFail(this, '修改失败')
          })
        }
      })
    }
  }
}
</script>
<style lang="scss" rel="stylesheet/scss" scoped>
  #password {
    margin-bottom: 20px;
  }
</style>

import { start } from '@/api/exam/examRecord'
import {setStore, getStore} from '@/utils/store'
import { submit } from '@/api/exam/answer'
import { PRACTICE, PRACTICE_RECORD, PRACTICE_SUBJECT } from '@/utils/storeMap'
const practice = {
  state: {
    practice: getStore({
      name: PRACTICE
    }) || {},
    practiceRecord: getStore({
      name: PRACTICE_RECORD
    }) || {},
    practiceSubject: getStore({
      name: PRACTICE_SUBJECT
    }) || {}
  },
  actions: {
    // 设置题目信息
    SetPracticeSubjectInfo ({ commit, state }, practiceSubject) {
      commit('SET_PRACTICE_SUBJECT', practiceSubject)
    },
    // 开始练习
    StartPractice ({ commit, state }, practiceRecord) {
      return new Promise((resolve, reject) => {
        start(practiceRecord).then(response => {
          commit('SET_PRACTICE', response.data.data.examination)
          commit('SET_PRACTICE_RECORD', response.data.data.examRecord)
          commit('SET_PRACTICE_SUBJECT', response.data.data.subjectDto)
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 提交练习
    SubmitPractice ({ commit, state }, practice) {
      return new Promise((resolve, reject) => {
        submit(practice).then(response => {
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    }
  },
  mutations: {
    SET_PRACTICE: (state, practice) => {
      state.practice = practice
      setStore({
        name: PRACTICE,
        content: state.practice
      })
    },
    SET_PRACTICE_RECORD: (state, practiceRecord) => {
      state.practiceRecord = practiceRecord
      setStore({
        name: PRACTICE_RECORD,
        content: state.practiceRecord
      })
    },
    SET_PRACTICE_SUBJECT: (state, practiceSubject) => {
      state.practiceSubject = practiceSubject
      setStore({
        name: PRACTICE_SUBJECT,
        content: state.practiceSubject
      })
    }
  }
}

export default practice

// Code generated by mockery v0.0.0-dev. DO NOT EDIT.

package mocks

import (
	predictor "sod/internal/predictor"

	mock "github.com/stretchr/testify/mock"
)

// ProvideFn is an autogenerated mock type for the ProvideFn type
type ProvideFn struct {
	mock.Mock
}

// Execute provides a mock function with given fields:
func (_m *ProvideFn) Execute() (predictor.Predictor, error) {
	ret := _m.Called()

	var r0 predictor.Predictor
	if rf, ok := ret.Get(0).(func() predictor.Predictor); ok {
		r0 = rf()
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(predictor.Predictor)
		}
	}

	var r1 error
	if rf, ok := ret.Get(1).(func() error); ok {
		r1 = rf()
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}
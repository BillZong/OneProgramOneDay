// D2_TrafficQuery.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CD2_TrafficQueryApp:
// �йش����ʵ�֣������ D2_TrafficQuery.cpp
//

class CD2_TrafficQueryApp : public CWinApp
{
public:
	CD2_TrafficQueryApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CD2_TrafficQueryApp theApp;
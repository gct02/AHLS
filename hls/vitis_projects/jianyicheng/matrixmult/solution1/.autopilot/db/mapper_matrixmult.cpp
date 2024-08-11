#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" void matrixmult(Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*, Byte<4>*);
extern "C" void apatb_matrixmult_hw(volatile void * __xlx_apatb_param_A_0, volatile void * __xlx_apatb_param_A_1, volatile void * __xlx_apatb_param_A_2, volatile void * __xlx_apatb_param_A_3, volatile void * __xlx_apatb_param_A_4, volatile void * __xlx_apatb_param_A_5, volatile void * __xlx_apatb_param_A_6, volatile void * __xlx_apatb_param_A_7, volatile void * __xlx_apatb_param_B_0, volatile void * __xlx_apatb_param_B_1, volatile void * __xlx_apatb_param_B_2, volatile void * __xlx_apatb_param_B_3, volatile void * __xlx_apatb_param_B_4, volatile void * __xlx_apatb_param_B_5, volatile void * __xlx_apatb_param_B_6, volatile void * __xlx_apatb_param_B_7, volatile void * __xlx_apatb_param_C_0, volatile void * __xlx_apatb_param_C_1, volatile void * __xlx_apatb_param_C_2, volatile void * __xlx_apatb_param_C_3, volatile void * __xlx_apatb_param_C_4, volatile void * __xlx_apatb_param_C_5, volatile void * __xlx_apatb_param_C_6, volatile void * __xlx_apatb_param_C_7) {
using hls::sim::createStream;
  // Collect __xlx_A_0__tmp_vec
std::vector<Byte<4>> __xlx_A_0__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_0)[i]);
}
  int __xlx_size_param_A_0 = 8192;
  int __xlx_offset_param_A_0 = 0;
  int __xlx_offset_byte_param_A_0 = 0*4;
  // Collect __xlx_A_1__tmp_vec
std::vector<Byte<4>> __xlx_A_1__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_1)[i]);
}
  int __xlx_size_param_A_1 = 8192;
  int __xlx_offset_param_A_1 = 0;
  int __xlx_offset_byte_param_A_1 = 0*4;
  // Collect __xlx_A_2__tmp_vec
std::vector<Byte<4>> __xlx_A_2__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_2)[i]);
}
  int __xlx_size_param_A_2 = 8192;
  int __xlx_offset_param_A_2 = 0;
  int __xlx_offset_byte_param_A_2 = 0*4;
  // Collect __xlx_A_3__tmp_vec
std::vector<Byte<4>> __xlx_A_3__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_3)[i]);
}
  int __xlx_size_param_A_3 = 8192;
  int __xlx_offset_param_A_3 = 0;
  int __xlx_offset_byte_param_A_3 = 0*4;
  // Collect __xlx_A_4__tmp_vec
std::vector<Byte<4>> __xlx_A_4__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_4)[i]);
}
  int __xlx_size_param_A_4 = 8192;
  int __xlx_offset_param_A_4 = 0;
  int __xlx_offset_byte_param_A_4 = 0*4;
  // Collect __xlx_A_5__tmp_vec
std::vector<Byte<4>> __xlx_A_5__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_5)[i]);
}
  int __xlx_size_param_A_5 = 8192;
  int __xlx_offset_param_A_5 = 0;
  int __xlx_offset_byte_param_A_5 = 0*4;
  // Collect __xlx_A_6__tmp_vec
std::vector<Byte<4>> __xlx_A_6__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_6)[i]);
}
  int __xlx_size_param_A_6 = 8192;
  int __xlx_offset_param_A_6 = 0;
  int __xlx_offset_byte_param_A_6 = 0*4;
  // Collect __xlx_A_7__tmp_vec
std::vector<Byte<4>> __xlx_A_7__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_A_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_A_7)[i]);
}
  int __xlx_size_param_A_7 = 8192;
  int __xlx_offset_param_A_7 = 0;
  int __xlx_offset_byte_param_A_7 = 0*4;
  // Collect __xlx_B_0__tmp_vec
std::vector<Byte<4>> __xlx_B_0__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_0)[i]);
}
  int __xlx_size_param_B_0 = 8192;
  int __xlx_offset_param_B_0 = 0;
  int __xlx_offset_byte_param_B_0 = 0*4;
  // Collect __xlx_B_1__tmp_vec
std::vector<Byte<4>> __xlx_B_1__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_1)[i]);
}
  int __xlx_size_param_B_1 = 8192;
  int __xlx_offset_param_B_1 = 0;
  int __xlx_offset_byte_param_B_1 = 0*4;
  // Collect __xlx_B_2__tmp_vec
std::vector<Byte<4>> __xlx_B_2__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_2)[i]);
}
  int __xlx_size_param_B_2 = 8192;
  int __xlx_offset_param_B_2 = 0;
  int __xlx_offset_byte_param_B_2 = 0*4;
  // Collect __xlx_B_3__tmp_vec
std::vector<Byte<4>> __xlx_B_3__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_3)[i]);
}
  int __xlx_size_param_B_3 = 8192;
  int __xlx_offset_param_B_3 = 0;
  int __xlx_offset_byte_param_B_3 = 0*4;
  // Collect __xlx_B_4__tmp_vec
std::vector<Byte<4>> __xlx_B_4__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_4)[i]);
}
  int __xlx_size_param_B_4 = 8192;
  int __xlx_offset_param_B_4 = 0;
  int __xlx_offset_byte_param_B_4 = 0*4;
  // Collect __xlx_B_5__tmp_vec
std::vector<Byte<4>> __xlx_B_5__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_5)[i]);
}
  int __xlx_size_param_B_5 = 8192;
  int __xlx_offset_param_B_5 = 0;
  int __xlx_offset_byte_param_B_5 = 0*4;
  // Collect __xlx_B_6__tmp_vec
std::vector<Byte<4>> __xlx_B_6__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_6)[i]);
}
  int __xlx_size_param_B_6 = 8192;
  int __xlx_offset_param_B_6 = 0;
  int __xlx_offset_byte_param_B_6 = 0*4;
  // Collect __xlx_B_7__tmp_vec
std::vector<Byte<4>> __xlx_B_7__tmp_vec;
for (size_t i = 0; i < 8192; ++i){
__xlx_B_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_B_7)[i]);
}
  int __xlx_size_param_B_7 = 8192;
  int __xlx_offset_param_B_7 = 0;
  int __xlx_offset_byte_param_B_7 = 0*4;
  // Collect __xlx_C_0__tmp_vec
std::vector<Byte<4>> __xlx_C_0__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_0__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_0)[i]);
}
  int __xlx_size_param_C_0 = 32;
  int __xlx_offset_param_C_0 = 0;
  int __xlx_offset_byte_param_C_0 = 0*4;
  // Collect __xlx_C_1__tmp_vec
std::vector<Byte<4>> __xlx_C_1__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_1__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_1)[i]);
}
  int __xlx_size_param_C_1 = 32;
  int __xlx_offset_param_C_1 = 0;
  int __xlx_offset_byte_param_C_1 = 0*4;
  // Collect __xlx_C_2__tmp_vec
std::vector<Byte<4>> __xlx_C_2__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_2__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_2)[i]);
}
  int __xlx_size_param_C_2 = 32;
  int __xlx_offset_param_C_2 = 0;
  int __xlx_offset_byte_param_C_2 = 0*4;
  // Collect __xlx_C_3__tmp_vec
std::vector<Byte<4>> __xlx_C_3__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_3__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_3)[i]);
}
  int __xlx_size_param_C_3 = 32;
  int __xlx_offset_param_C_3 = 0;
  int __xlx_offset_byte_param_C_3 = 0*4;
  // Collect __xlx_C_4__tmp_vec
std::vector<Byte<4>> __xlx_C_4__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_4__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_4)[i]);
}
  int __xlx_size_param_C_4 = 32;
  int __xlx_offset_param_C_4 = 0;
  int __xlx_offset_byte_param_C_4 = 0*4;
  // Collect __xlx_C_5__tmp_vec
std::vector<Byte<4>> __xlx_C_5__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_5__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_5)[i]);
}
  int __xlx_size_param_C_5 = 32;
  int __xlx_offset_param_C_5 = 0;
  int __xlx_offset_byte_param_C_5 = 0*4;
  // Collect __xlx_C_6__tmp_vec
std::vector<Byte<4>> __xlx_C_6__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_6__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_6)[i]);
}
  int __xlx_size_param_C_6 = 32;
  int __xlx_offset_param_C_6 = 0;
  int __xlx_offset_byte_param_C_6 = 0*4;
  // Collect __xlx_C_7__tmp_vec
std::vector<Byte<4>> __xlx_C_7__tmp_vec;
for (size_t i = 0; i < 32; ++i){
__xlx_C_7__tmp_vec.push_back(((Byte<4>*)__xlx_apatb_param_C_7)[i]);
}
  int __xlx_size_param_C_7 = 32;
  int __xlx_offset_param_C_7 = 0;
  int __xlx_offset_byte_param_C_7 = 0*4;
  // DUT call
  matrixmult(__xlx_A_0__tmp_vec.data(), __xlx_A_1__tmp_vec.data(), __xlx_A_2__tmp_vec.data(), __xlx_A_3__tmp_vec.data(), __xlx_A_4__tmp_vec.data(), __xlx_A_5__tmp_vec.data(), __xlx_A_6__tmp_vec.data(), __xlx_A_7__tmp_vec.data(), __xlx_B_0__tmp_vec.data(), __xlx_B_1__tmp_vec.data(), __xlx_B_2__tmp_vec.data(), __xlx_B_3__tmp_vec.data(), __xlx_B_4__tmp_vec.data(), __xlx_B_5__tmp_vec.data(), __xlx_B_6__tmp_vec.data(), __xlx_B_7__tmp_vec.data(), __xlx_C_0__tmp_vec.data(), __xlx_C_1__tmp_vec.data(), __xlx_C_2__tmp_vec.data(), __xlx_C_3__tmp_vec.data(), __xlx_C_4__tmp_vec.data(), __xlx_C_5__tmp_vec.data(), __xlx_C_6__tmp_vec.data(), __xlx_C_7__tmp_vec.data());
// print __xlx_apatb_param_A_0
for (size_t i = 0; i < __xlx_size_param_A_0; ++i) {
((Byte<4>*)__xlx_apatb_param_A_0)[i] = __xlx_A_0__tmp_vec[__xlx_offset_param_A_0+i];
}
// print __xlx_apatb_param_A_1
for (size_t i = 0; i < __xlx_size_param_A_1; ++i) {
((Byte<4>*)__xlx_apatb_param_A_1)[i] = __xlx_A_1__tmp_vec[__xlx_offset_param_A_1+i];
}
// print __xlx_apatb_param_A_2
for (size_t i = 0; i < __xlx_size_param_A_2; ++i) {
((Byte<4>*)__xlx_apatb_param_A_2)[i] = __xlx_A_2__tmp_vec[__xlx_offset_param_A_2+i];
}
// print __xlx_apatb_param_A_3
for (size_t i = 0; i < __xlx_size_param_A_3; ++i) {
((Byte<4>*)__xlx_apatb_param_A_3)[i] = __xlx_A_3__tmp_vec[__xlx_offset_param_A_3+i];
}
// print __xlx_apatb_param_A_4
for (size_t i = 0; i < __xlx_size_param_A_4; ++i) {
((Byte<4>*)__xlx_apatb_param_A_4)[i] = __xlx_A_4__tmp_vec[__xlx_offset_param_A_4+i];
}
// print __xlx_apatb_param_A_5
for (size_t i = 0; i < __xlx_size_param_A_5; ++i) {
((Byte<4>*)__xlx_apatb_param_A_5)[i] = __xlx_A_5__tmp_vec[__xlx_offset_param_A_5+i];
}
// print __xlx_apatb_param_A_6
for (size_t i = 0; i < __xlx_size_param_A_6; ++i) {
((Byte<4>*)__xlx_apatb_param_A_6)[i] = __xlx_A_6__tmp_vec[__xlx_offset_param_A_6+i];
}
// print __xlx_apatb_param_A_7
for (size_t i = 0; i < __xlx_size_param_A_7; ++i) {
((Byte<4>*)__xlx_apatb_param_A_7)[i] = __xlx_A_7__tmp_vec[__xlx_offset_param_A_7+i];
}
// print __xlx_apatb_param_B_0
for (size_t i = 0; i < __xlx_size_param_B_0; ++i) {
((Byte<4>*)__xlx_apatb_param_B_0)[i] = __xlx_B_0__tmp_vec[__xlx_offset_param_B_0+i];
}
// print __xlx_apatb_param_B_1
for (size_t i = 0; i < __xlx_size_param_B_1; ++i) {
((Byte<4>*)__xlx_apatb_param_B_1)[i] = __xlx_B_1__tmp_vec[__xlx_offset_param_B_1+i];
}
// print __xlx_apatb_param_B_2
for (size_t i = 0; i < __xlx_size_param_B_2; ++i) {
((Byte<4>*)__xlx_apatb_param_B_2)[i] = __xlx_B_2__tmp_vec[__xlx_offset_param_B_2+i];
}
// print __xlx_apatb_param_B_3
for (size_t i = 0; i < __xlx_size_param_B_3; ++i) {
((Byte<4>*)__xlx_apatb_param_B_3)[i] = __xlx_B_3__tmp_vec[__xlx_offset_param_B_3+i];
}
// print __xlx_apatb_param_B_4
for (size_t i = 0; i < __xlx_size_param_B_4; ++i) {
((Byte<4>*)__xlx_apatb_param_B_4)[i] = __xlx_B_4__tmp_vec[__xlx_offset_param_B_4+i];
}
// print __xlx_apatb_param_B_5
for (size_t i = 0; i < __xlx_size_param_B_5; ++i) {
((Byte<4>*)__xlx_apatb_param_B_5)[i] = __xlx_B_5__tmp_vec[__xlx_offset_param_B_5+i];
}
// print __xlx_apatb_param_B_6
for (size_t i = 0; i < __xlx_size_param_B_6; ++i) {
((Byte<4>*)__xlx_apatb_param_B_6)[i] = __xlx_B_6__tmp_vec[__xlx_offset_param_B_6+i];
}
// print __xlx_apatb_param_B_7
for (size_t i = 0; i < __xlx_size_param_B_7; ++i) {
((Byte<4>*)__xlx_apatb_param_B_7)[i] = __xlx_B_7__tmp_vec[__xlx_offset_param_B_7+i];
}
// print __xlx_apatb_param_C_0
for (size_t i = 0; i < __xlx_size_param_C_0; ++i) {
((Byte<4>*)__xlx_apatb_param_C_0)[i] = __xlx_C_0__tmp_vec[__xlx_offset_param_C_0+i];
}
// print __xlx_apatb_param_C_1
for (size_t i = 0; i < __xlx_size_param_C_1; ++i) {
((Byte<4>*)__xlx_apatb_param_C_1)[i] = __xlx_C_1__tmp_vec[__xlx_offset_param_C_1+i];
}
// print __xlx_apatb_param_C_2
for (size_t i = 0; i < __xlx_size_param_C_2; ++i) {
((Byte<4>*)__xlx_apatb_param_C_2)[i] = __xlx_C_2__tmp_vec[__xlx_offset_param_C_2+i];
}
// print __xlx_apatb_param_C_3
for (size_t i = 0; i < __xlx_size_param_C_3; ++i) {
((Byte<4>*)__xlx_apatb_param_C_3)[i] = __xlx_C_3__tmp_vec[__xlx_offset_param_C_3+i];
}
// print __xlx_apatb_param_C_4
for (size_t i = 0; i < __xlx_size_param_C_4; ++i) {
((Byte<4>*)__xlx_apatb_param_C_4)[i] = __xlx_C_4__tmp_vec[__xlx_offset_param_C_4+i];
}
// print __xlx_apatb_param_C_5
for (size_t i = 0; i < __xlx_size_param_C_5; ++i) {
((Byte<4>*)__xlx_apatb_param_C_5)[i] = __xlx_C_5__tmp_vec[__xlx_offset_param_C_5+i];
}
// print __xlx_apatb_param_C_6
for (size_t i = 0; i < __xlx_size_param_C_6; ++i) {
((Byte<4>*)__xlx_apatb_param_C_6)[i] = __xlx_C_6__tmp_vec[__xlx_offset_param_C_6+i];
}
// print __xlx_apatb_param_C_7
for (size_t i = 0; i < __xlx_size_param_C_7; ++i) {
((Byte<4>*)__xlx_apatb_param_C_7)[i] = __xlx_C_7__tmp_vec[__xlx_offset_param_C_7+i];
}
}

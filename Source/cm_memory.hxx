/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
#ifndef cm_memory_hxx
#define cm_memory_hxx

#include "cmConfigure.h" // IWYU pragma: keep

#include <memory> // IWYU pragma: export
#if !defined(CMake_HAVE_CXX_MAKE_UNIQUE)
#  include <utility>
#endif

namespace cm {

#if defined(CMake_HAVE_CXX_MAKE_UNIQUE)

using std::make_unique;

#else

template <typename T, typename... Args>
std::unique_ptr<T> make_unique(Args&&... args)
{
  return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
}

#endif

} // namespace cm

#endif

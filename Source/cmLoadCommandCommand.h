/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
#ifndef cmLoadCommandCommand_h
#define cmLoadCommandCommand_h

#include "cmConfigure.h" // IWYU pragma: keep

#include <string>
#include <vector>

#include "cm_memory.hxx"

#include "cmCommand.h"

class cmExecutionStatus;

class cmLoadCommandCommand : public cmCommand
{
public:
  std::unique_ptr<cmCommand> Clone() override
  {
    return cm::make_unique<cmLoadCommandCommand>();
  }
  bool InitialPass(std::vector<std::string> const& args,
                   cmExecutionStatus& status) override;
};

#endif

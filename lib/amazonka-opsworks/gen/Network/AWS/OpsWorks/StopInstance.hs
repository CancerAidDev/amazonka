{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.OpsWorks.StopInstance
-- Copyright   : (c) 2013-2020 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Stops a specified instance. When you stop a standard instance, the data disappears and must be reinstalled when you restart the instance. You can stop an Amazon EBS-backed instance without losing data. For more information, see <https://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html Starting, Stopping, and Rebooting Instances> .
--
--
-- __Required Permissions__ : To use this action, an IAM user must have a Manage permissions level for the stack, or an attached policy that explicitly grants permissions. For more information on user permissions, see <https://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions> .
module Network.AWS.OpsWorks.StopInstance
  ( -- * Creating a Request
    stopInstance,
    StopInstance,

    -- * Request Lenses
    siForce,
    siInstanceId,

    -- * Destructuring the Response
    stopInstanceResponse,
    StopInstanceResponse,
  )
where

import Network.AWS.Lens
import Network.AWS.OpsWorks.Types
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'stopInstance' smart constructor.
data StopInstance = StopInstance'
  { _siForce :: !(Maybe Bool),
    _siInstanceId :: !Text
  }
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'StopInstance' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'siForce' - Specifies whether to force an instance to stop. If the instance's root device type is @ebs@ , or EBS-backed, adding the @Force@ parameter to the @StopInstances@ API call disassociates the AWS OpsWorks Stacks instance from EC2, and forces deletion of /only/ the OpsWorks Stacks instance. You must also delete the formerly-associated instance in EC2 after troubleshooting and replacing the AWS OpsWorks Stacks instance with a new one.
--
-- * 'siInstanceId' - The instance ID.
stopInstance ::
  -- | 'siInstanceId'
  Text ->
  StopInstance
stopInstance pInstanceId_ =
  StopInstance' {_siForce = Nothing, _siInstanceId = pInstanceId_}

-- | Specifies whether to force an instance to stop. If the instance's root device type is @ebs@ , or EBS-backed, adding the @Force@ parameter to the @StopInstances@ API call disassociates the AWS OpsWorks Stacks instance from EC2, and forces deletion of /only/ the OpsWorks Stacks instance. You must also delete the formerly-associated instance in EC2 after troubleshooting and replacing the AWS OpsWorks Stacks instance with a new one.
siForce :: Lens' StopInstance (Maybe Bool)
siForce = lens _siForce (\s a -> s {_siForce = a})

-- | The instance ID.
siInstanceId :: Lens' StopInstance Text
siInstanceId = lens _siInstanceId (\s a -> s {_siInstanceId = a})

instance AWSRequest StopInstance where
  type Rs StopInstance = StopInstanceResponse
  request = postJSON opsWorks
  response = receiveNull StopInstanceResponse'

instance Hashable StopInstance

instance NFData StopInstance

instance ToHeaders StopInstance where
  toHeaders =
    const
      ( mconcat
          [ "X-Amz-Target"
              =# ("OpsWorks_20130218.StopInstance" :: ByteString),
            "Content-Type" =# ("application/x-amz-json-1.1" :: ByteString)
          ]
      )

instance ToJSON StopInstance where
  toJSON StopInstance' {..} =
    object
      ( catMaybes
          [("Force" .=) <$> _siForce, Just ("InstanceId" .= _siInstanceId)]
      )

instance ToPath StopInstance where
  toPath = const "/"

instance ToQuery StopInstance where
  toQuery = const mempty

-- | /See:/ 'stopInstanceResponse' smart constructor.
data StopInstanceResponse = StopInstanceResponse'
  deriving (Eq, Read, Show, Data, Typeable, Generic)

-- | Creates a value of 'StopInstanceResponse' with the minimum fields required to make a request.
stopInstanceResponse ::
  StopInstanceResponse
stopInstanceResponse = StopInstanceResponse'

instance NFData StopInstanceResponse
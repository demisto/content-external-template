from tools.prepare_private_id_set_for_merge import remove_old_pack_from_private_id_set
from unittest.mock import mock_open


NEW_ID_SET_WITH_ONE_PACK = '''{
    "scripts": [],
    "playbooks": [
        {
            "Github": {
                "name": "Github",
                "pack": "Github"
            }
        }
    ],
    "integrations": [
        {
            "Github": {
                "name": "Github",
                "pack": "Github"
            }
        }
    ],
    "TestPlaybooks": [],
    "Classifiers": [],
    "Dashboards": [],
    "IncidentFields": [],
    "IncidentTypes": [],
    "IndicatorFields": [],
    "IndicatorTypes": [],
    "Layouts": [],
    "Reports": [],
    "Widgets": [],
    "Mappers": []
}'''


NEW_ID_SET_WITH_MORE_THAN_ONE_PACK = '''{
    "scripts": [],
    "playbooks": [
        {
            "Okta": {
                "name": "Okta",
                "pack": "Okta"
            }
        }
    ],
    "integrations": [
        {
            "Workday": {
                "name": "Workday",
                "pack": "Workday"
            }
        }
    ],
    "TestPlaybooks": [],
    "Classifiers": [],
    "Dashboards": [],
    "IncidentFields": [],
    "IncidentTypes": [],
    "IndicatorFields": [],
    "IndicatorTypes": [],
    "Layouts": [],
    "Reports": [],
    "Widgets": [],
    "Mappers": []
}'''


PRIVATE_ID_SET = {
    "scripts": [],
    "playbooks": [],
    "integrations": [
        {
            "Workday": {
                "name": "Workday",
                "pack": "Workday"
            }
        },
        {
            "Accessdata": {
                "name": "Accessdata",
                "pack": "Accessdata"
            }
        },
        {
            "ActiveMQ": {
                "name": "ActiveMQ",
                "pack": "ActiveMQ"
            }
        },
        {
            "Github": {
                "name": "Github",
                "pack": "Github"
            }
        },
        {
            "Okta": {
                "name": "Okta",
                "pack": "Okta"
            }
        }
    ],
    "TestPlaybooks": [],
    "Classifiers": [],
    "Dashboards": [],
    "IncidentFields": [],
    "IncidentTypes": [],
    "IndicatorFields": [],
    "IndicatorTypes": [],
    "Layouts": [],
    "Reports": [],
    "Widgets": [],
    "Mappers": []
}

WORKDAY_PACK = {"Workday": {"name": "Workday", "pack": "Workday"}}
ACCESSDATA_PACK = {"Accessdata": {"name": "Accessdata", "pack": "Accessdata"}}
ACTIVEMQ_PACK = {"ActiveMQ": {"name": "ActiveMQ", "pack": "ActiveMQ"}}
OKTA_PACK = {"Okta": {"name": "Okta", "pack": "Okta"}}
GITHUB_PACK = {"Github": {"name": "Github", "pack": "Github"}}


# Test for new ID set with more then one pack.
def test_remove_old_packs_from_private_id_set(mocker):
    """
    Given
    - private ID set - to prepare for merge with the new pack
    - new pack name - to remove the old data from the ID set - not mandatory
    - new pack ID set - to get the new packs name
    When
    - remove the old new pack's data from private ID set, by the new packs name or by new packs ID set
    Then
    - ensure that the private ID set not contain the old new pack's data
    - ensure that in case there is no pack name, get the new packs name from the new pack ID set
    """

    private_id_set = remove_old_pack_from_private_id_set(PRIVATE_ID_SET, 'Accessdata')
    assert ACCESSDATA_PACK not in private_id_set['integrations']

    mocker.patch('builtins.open', mock_open(read_data=NEW_ID_SET_WITH_MORE_THAN_ONE_PACK))
    private_id_set = remove_old_pack_from_private_id_set(PRIVATE_ID_SET, '')
    assert WORKDAY_PACK not in private_id_set['integrations']
    assert OKTA_PACK not in private_id_set['integrations']
    assert GITHUB_PACK in private_id_set['integrations']


# Test for new ID set with one pack.
def test_remove_old_pack_from_private_id_set(mocker):
    """
    Given
    - private ID set - to prepare for merge with the new pack
    - new pack name - to remove the old data from the ID set not mandatory
    - new pack ID set - to get the new pack name
    When
    - remove the old new pack's data from private ID set, by the new pack name or by new pack ID set
    Then
    - ensure that the private ID set not contain the old new pack's data
    - ensure that in case there is no pack name, get the new pack name from the new pack ID set
    """

    private_id_set = remove_old_pack_from_private_id_set(PRIVATE_ID_SET, 'Accessdata')
    assert ACCESSDATA_PACK not in private_id_set['integrations']

    mocker.patch('builtins.open', mock_open(read_data=NEW_ID_SET_WITH_ONE_PACK))
    private_id_set = remove_old_pack_from_private_id_set(PRIVATE_ID_SET, '')
    assert WORKDAY_PACK in private_id_set['integrations']
    assert ACTIVEMQ_PACK in private_id_set['integrations']
    assert GITHUB_PACK not in private_id_set['integrations']

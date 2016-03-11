package ${packageName}.di.modules;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import org.greenrobot.eventbus.EventBus;

@Module
@Singleton
public class EventBusModule {
    @Provides
    @Singleton
    EventBus providesEventBus() {
        return EventBus.getDefault();
    }
}
package ${packageName}.di.modules;

import java.util.concurrent.TimeUnit;

import javax.inject.Named;
import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import  ${packageName}.${applicationClass};
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
<#if gson> import retrofit2.converter.gson.GsonConverterFactory;</#if>
<#if rxjava>import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;</#if>

@Module
@Singleton
public class NetworkModule {

	<#if gson>
		@Provides
		@Singleton
		GsonConverterFactory providesGsonFactory() {
			return GsonConverterFactory.create();
		}
	</#if>
	
	<#if rxjava>
		@Provides
		@Singleton
		RxJavaCallAdapterFactory providesRxJavaCallAdapterFactory(){
			return RxJavaCallAdapterFactory.create();
		}
	</#if>

    @Provides
    @Singleton
    HttpLoggingInterceptor providesHttpLoggingInterceptor() {
        HttpLoggingInterceptor interceptor = new HttpLoggingInterceptor();
        interceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
        return interceptor;
    }


    @Provides
    @Singleton
    OkHttpClient providesOKClient(HttpLoggingInterceptor interceptor) {
        return new OkHttpClient.Builder()
                .addInterceptor(interceptor)
                .retryOnConnectionFailure(true)
                .connectTimeout(15, TimeUnit.SECONDS)
                .readTimeout(20, TimeUnit.SECONDS)
                .build();
    }
	

		@Provides
		@Singleton
		Retrofit providesRestAdapter(OkHttpClient client<#if gson>, GsonConverterFactory gsonConverterFactory</#if><#if rxjava>, RxJavaCallAdapterFactory rxJavaAdapterFactory</#if>) {
			return new Retrofit.Builder()
					.baseUrl(${applicationClass}.ENDPOINT)
					<#if gson>.addConverterFactory(gsonConverterFactory)</#if>
					<#if rxjava>.addCallAdapterFactory(rxJavaAdapterFactory)</#if>
					.client(client)
					.build();
		}

}
